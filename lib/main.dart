import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_25/pages/login_page.dart';
import 'package:pas1_mobile_11pplg2_25/pages/responsive_layout.dart';
import 'bindings/bindings.dart';
import 'controller/responsive_controller.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final ResponsiveController controllers = Get.put(ResponsiveController());
    return GetMaterialApp(
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/dashboard', page: () =>LayoutBuilder(builder: (context, constraints) {
          controllers.updateScreenWidth(constraints.maxWidth);
          return ResponsiveLayout();
        }), binding: MyBindings()),
      ],
    );
  }
}