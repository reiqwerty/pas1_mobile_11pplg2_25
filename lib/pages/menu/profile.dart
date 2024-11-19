import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/responsive_controller.dart';
import '../responsive_layout.dart';

class ProfilePage extends StatelessWidget {
  final ResponsiveController responsiveController = Get.put(ResponsiveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constrain) {
        responsiveController.updateScreenWidth(constrain.maxWidth);
        return ResponsiveLayout();
      }),
    );
  }
}
