import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_getx/controllers/update_control.dart';
import 'package:last_getx/models/user.dart';
import 'package:last_getx/widgets/textfield_build.dart';

class UpdatePage extends StatefulWidget {
  static final String Route_name = "/Update_page";
  final User? user;
  const UpdatePage({Key? key, this.user}) : super(key: key);
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  var control1 = TextEditingController();
  var control2 = TextEditingController();
  var controller = Get.put(Update_Control());

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      control1.text = widget.user!.title;
      control2.text = widget.user!.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    // GetX
    return Obx(
      () => Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Update user"),
        ),
        body: Center(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    My_Textfield(hint: "Title", con: control1),
                    My_Textfield(
                      hint: "Body",
                      con: control2,
                    ),
                  ],
                ),
              ),
              controller.isloading.value
                  ? Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(.3),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            var title = control1.text.trim();
            var body = control2.text.trim();
            var user = widget.user!;
            if (title.isNotEmpty && body.isNotEmpty) {
              if (title == user.title && body == user.body) {
                Get.back();
                return null;
              }
              controller
                  .update_user(title, body, widget.user!.id)
                  .then((string_json) {
                if (string_json.isNotEmpty) {
                  Get.back(result: string_json);
                }
              });
            }
          },
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
