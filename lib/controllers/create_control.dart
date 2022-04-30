import 'package:get/get.dart';
import 'package:last_getx/models/user.dart';
import 'package:last_getx/services/dio_net.dart';

class Create_Control extends GetxController {
  var isloading = false.obs;

  Future<String> Create_user(User u) async {
    isloading(true);
    var res = await Net_Dio.Create(u);
    isloading(false);
    return res;
  }
}
