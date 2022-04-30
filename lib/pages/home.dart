import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_getx/controllers/home_control.dart';
import 'package:last_getx/pages/create_page.dart';
import 'package:last_getx/views/home_view.dart';

class Home extends StatefulWidget {
  static var ROUTE = "/Home";
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var list_key = GlobalKey<AnimatedListState>();
  var controller = Get.put(Home_control());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Obx(
      () => Scaffold(
        backgroundColor: Color.fromARGB(255, 51, 48, 48),
        appBar: AppBar(
          title: Text("GetX Users = ${controller.base_list.length}"),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: controller.isLoading.value
              ? Container(
                  height: height,
                  width: width,
                  color: Colors.black.withOpacity(0.4),
                  alignment: Alignment.center,
                  child: Container(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator.adaptive(),
                  ),
                )
              : controller.base_list.isNotEmpty
                  ? AnimatedList(
                      key: list_key,
                      initialItemCount: controller.base_list.length,
                      itemBuilder: (context, index, animation) => UserItem(
                        width: width,
                        index: index,
                        u: controller.base_list[index],
                        controll: controller,
                        animation: animation,
                        Remove: (all_list) {
                          final removed_item = controller.base_list[index];
                          controller.list_item_delete(index, removed_item);
                          list_key.currentState!.removeItem(
                            index,
                            (context, animation) => UserItem(
                                width: width,
                                index: index,
                                u: removed_item,
                                controll: controller,
                                animation: animation,
                                Remove: (ll) {}),
                          );
                        },
                      ),
                    )
                  : Text("no data"),
          // no change bo loading
          // if i change any textfield
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Create_page.ROUTE).obs.value?.then((new_user) {
              if (new_user != null) {
                controller.add_user(new_user);
                print("added item id = ${new_user.id}");
                list_key.currentState
                    ?.insertItem(controller.base_list.length - 1);
              }
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
