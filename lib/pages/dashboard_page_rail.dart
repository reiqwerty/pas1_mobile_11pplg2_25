import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller/dashboard_controller.dart';
import 'menu/favorite.dart';
import 'menu/home.dart';
import 'menu/profile_tablet.dart';

class DashboardPageRail extends StatelessWidget {
  const DashboardPageRail({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController navController = Get.find();
    final List<Widget> menus = [
      ProfilePageTablet(),
      HomePage(),
      FavoritePage()
    ];

    return Scaffold(
      body: Row(
        children: [
          Obx(() => NavigationRail(
            selectedIndex: navController.selectedIndex.value,
            onDestinationSelected: (int index) {
              navController.changeMenu(index);
            },
            minWidth: 80,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.person_rounded, color: Colors.white),
                selectedIcon: Icon(Icons.person_rounded, color: Color(0xffFAFF00)),
                label: Text("Profile"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.home_filled, color: Colors.white),
                selectedIcon: Icon(Icons.home_filled, color: Color(0xffFAFF00)),
                label: Text("Home"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite, color: Colors.white),
                selectedIcon: Icon(Icons.favorite, color: Color(0xffFAFF00)),
                label: Text("Favorite"),
              ),
            ],
            backgroundColor: Colors.black,
            indicatorColor: Colors.transparent,
            selectedLabelTextStyle: TextStyle(color: Colors.yellowAccent,),
            unselectedLabelTextStyle: TextStyle(color: Colors.white),
            labelType: NavigationRailLabelType.selected,
            groupAlignment: 0.0,
          )),
          Expanded(
            child: Obx(() {
              return menus[navController.selectedIndex.value];
            }),
          ),
        ],
      ),

    );
  }
}