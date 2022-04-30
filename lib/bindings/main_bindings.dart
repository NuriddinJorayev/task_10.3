import 'package:get/get.dart';
import 'package:last_getx/controllers/create_control.dart';
import 'package:last_getx/controllers/home_control.dart';
import 'package:last_getx/controllers/update_control.dart';
import 'package:last_getx/pages/home.dart';

class Home_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Home_control>(() => Home_control());
  }
}

class create_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Create_Control>(() => Create_Control());
  }
}

class Update_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Update_Control>(() => Update_Control());
  }
}
