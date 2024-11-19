import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../widget/my_image.dart';
import '../widget/my_text.dart';
import '../widget/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0C0C0C),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            Center(
              child: MyText(
                text: 'Football Update',
                fontSize: 18,
                colors: Colors.yellow,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: MyImage(
                imagePath: 'assets/images/logo.png',
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            MyTextField(
              hintText: 'Username',
              controller: usernameController,
              icon: Icons.person_outline,
            ),
            MyTextField(
              hintText: 'Password',
              isPassword: true,
              controller: passwordController,
              icon: Icons.lock_outline,
            ),
            SizedBox(height: 16),
            Obx(() => ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.yellow),
                padding: WidgetStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              onPressed: controller.isLoading.value
                  ? null
                  : () async {
                if (usernameController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: MyText(
                        text: "Nama atau Password tidak boleh kosong!",
                        fontSize: 16,
                        colors: Colors.white,
                      ),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                } else {
                  await controller.login(usernameController.text,
                      passwordController.text);
                  if (controller.loginStatus.value == "Login success") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: MyText(
                          text: "Login berhasil!",
                          fontSize: 16,
                          colors: Colors.white,
                        ),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    Get.toNamed('/dashboard');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: MyText(
                          text: controller.loginStatus.value,
                          fontSize: 16,
                          colors: Colors.white,
                        ),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  }
                }
              },
              child: controller.isLoading.value
                  ? CircularProgressIndicator(
                color: Colors.black,
              )
                  : MyText(
                text: "Login",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                colors: Colors.black,
              ),
            )),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 294),
              child: MyText(
                text: "Forgot Password?",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                colors: Colors.white,
              ),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: "Tidak memiliki akun? ",
                  fontSize: 16,
                  colors: Colors.white,
                ),
                GestureDetector(
                  onTap: () {
                    },
                  child: MyText(
                    text: 'Register',
                    fontSize: 16,
                    colors: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
