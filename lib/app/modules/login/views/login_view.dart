import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/app/modules/forgot/views/forgot_view.dart';
import 'package:movie/app/routes/app_pages.dart';

import '../../register/views/register_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginView({Key? key}) : super(key: key) {
    Get.put(LoginController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //     color: Colors.black,
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Get.offAllNamed(Routes.HOME);
      //     },
      //   ),
      // ),
      // resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30, color: Color.fromRGBO(96, 97, 250, 1)),
            ),
            Text(
              "Enter email and password to login....",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            Image.asset(
              "assets/loginHero.png",
              width: 300,
              height: 300,
            ),
            // Text(
            //   " ",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontSize: 20),
            // ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            TextField(
              controller: emailController,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelText: "Email",
              ),
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              scrollPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.bottom),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelText: "Password",
              ),
            ),
            TextButton(
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 40, 43, 236)),
                textAlign: TextAlign.end,
              ),
              onPressed: () => Get.to(() => ForgotView()),
            ),
            SizedBox(
              height: 20,
              width: 20,
            ),
            SizedBox(
                height: 60,
                width: 300,
                child: GetBuilder<LoginController>(
                  init: LoginController(),
                  builder: (controller) {
                    return ElevatedButton(
                      onPressed: () {
                        var loginController = Get.find<LoginController>();

                        var email = emailController.text;
                        var password = passwordController.text;

                        loginController.loginUser(email, password);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(96, 97, 250, 1),
                          elevation: 5,
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.all(10)),
                      child: Text("LOGIN"),
                    );
                  },
                )),
            TextButton(
              child: Text(
                "Don\'t have an account? Sign Up",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              onPressed: () => Get.to(() => RegisterView()),
            ),
          ],
        ),
      ),
    );
  }
}
