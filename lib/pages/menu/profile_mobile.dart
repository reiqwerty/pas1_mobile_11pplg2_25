import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widget/my_text.dart';

class ProfilePageMobile extends StatelessWidget {
  const ProfilePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0C0C0C),
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: MyText(
              text: 'Profile',
              fontSize: 20,
              colors: Colors.yellowAccent
          ),
          centerTitle: true,
          automaticallyImplyLeading: false
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/pfp.png'),
              ),
            ),
            SizedBox(height: 15),
            MyText(text: 'Rayhan Fathurrahman Rabbani', fontSize: 18, colors: Colors.white, fontWeight: FontWeight.bold),
            SizedBox(height: 5),
            MyText(text: 'Favorite Team: Real Madrid', fontSize: 16, colors: Colors.grey),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.toNamed('/login');
                },
                icon: Icon(Icons.logout, color: Colors.white),
                label: MyText(text: 'Logout', fontSize: 14, colors: Colors.white),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
