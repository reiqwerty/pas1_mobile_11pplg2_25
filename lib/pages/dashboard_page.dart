import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/dashboard_controller.dart';
import 'menu/favorite.dart';
import 'menu/home.dart';
import 'menu/profile_mobile.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find();

    final List<Widget> menus = [
      HomePage(),
      FavoritePage(),
      ProfilePageMobile()
    ];

    return Obx(() {
      return Scaffold(
        body: menus[dashboardController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: dashboardController.selectedIndex.value,
          onTap: dashboardController.changeMenu,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Color(0xffFAFF00),
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
            BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile')
          ],
        ),
      );
    });
  }
}