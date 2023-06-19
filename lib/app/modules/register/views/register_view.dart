import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RegisterView({Key? key}) : super(key: key) {
    Get.put(RegisterController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed(Routes.LOGIN);
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image.asset(
              //       "",
              //   width: 200,
              //   height: 200,
              // ),
              Text(
                "Register",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 40, color: Color.fromRGBO(96, 97, 250, 1)),
              ),
              Text(
                "Plese, fill the fields",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 5,
                width: 5,
              ),
              SizedBox(
                height: 5,
                width: 5,
              ),
              TextField(
                controller: firstnameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: "First Name",
                ),
              ),
              SizedBox(
                height: 5,
                width: 5,
              ),
              TextField(
                controller: lastnameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: "Last Name",
                ),
              ),
              SizedBox(
                height: 5,
                width: 5,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: "Email",
                ),
              ),
              SizedBox(
                height: 5,
                width: 5,
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
              SizedBox(
                height: 5,
                width: 5,
              ),
              TextField(
                obscureText: true,
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: "Re-Password",
                ),
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              SizedBox(
                  height: 50,
                  width: 290,
                  child: GetBuilder<RegisterController>(
                      init: RegisterController(), //inisialisasi controller
                      builder: (controller) {
                        return ElevatedButton(
                          onPressed: () {
                            // Mengambil instance RegisterController
                            var registerController =
                                Get.find<RegisterController>();

                            // Mengambil nilai dari TextField
                            var firstname = firstnameController.text;
                            var lastname = lastnameController.text;
                            var email = emailController.text;
                            var password = passwordController.text;
                            var confirmPassword =
                                confirmPasswordController.text;

                            // Memanggil fungsi registerUser dengan parameter-parameter yang diperlukan
                            registerController.registerUser(firstname, lastname,
                                email, password, confirmPassword);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              elevation: 5,
                              shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.all(20)),
                          child: Text('REGISTER'),
                        );
                      }))
            ]),
      ),
    );
  }
}
