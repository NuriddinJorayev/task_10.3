import 'dart:convert';

import 'package:get/get.dart';
import 'package:last_getx/models/user.dart';
import 'package:last_getx/services/dio_net.dart';

class Home_control extends GetxController {
  var base_list = List<User>.empty().obs;
  var isLoading = false.obs;
  var isDio = false.obs;

  Home_control() {
    initialize();
  }

  List<User> list_item_delete(int index, User u) {
    Net_Dio.Delete(u);
    base_list.removeAt(index);
    base_list = base_list;

    return base_list;
  }

  setstate() {}

  initialize() async {
    print("init");
    isLoading(true);
    var json = await Net_Dio.GET();
    get(json);
    isLoading(false);
  }

  add_user(User u) {
    base_list.add(u);
  }

  update_user(int index, User u) {
    base_list[index] = u;
  }

  List<User> get(String json) {
    base_list.value =
        List<User>.from(jsonDecode(json).map((e) => User.fromjson(e)));
    print(base_list.length);
    return base_list;
  }
}
