import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:last_getx/bindings/main_bindings.dart';
import 'package:last_getx/pages/create_page.dart';
import 'package:last_getx/pages/home.dart';
import 'package:last_getx/pages/update_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Home_binding(),
      home: Home(),
      getPages: [
        GetPage(name: Home.ROUTE, page: () => Home(), binding: Home_binding()),
        GetPage(
            name: Create_page.ROUTE,
            page: () => Create_page(),
            binding: create_binding()),
        GetPage(
            name: UpdatePage.Route_name,
            page: () => UpdatePage(),
            binding: Update_binding()),
      ],
    );
  }
}
