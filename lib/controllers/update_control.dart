import 'package:get/get.dart';
import 'package:last_getx/models/user.dart';
import 'package:last_getx/services/dio_net.dart';

class Update_Control extends GetxController {
  var isloading = false.obs;

  Future<String> update_user(String title, String body, String id) async {
    isloading(true);
    var a = await Net_Dio.Update(User(id: id, title: title, body: body));
    isloading(false);
    return a;
  }
}
