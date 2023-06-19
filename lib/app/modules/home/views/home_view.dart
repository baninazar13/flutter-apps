import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie/app/modules/login/views/login_view.dart';
import 'package:movie/app/modules/register/views/register_view.dart';
import 'package:movie/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              "assets/loginHero.png",
              width: 300,
              height: 300,
            ),
            SizedBox(
              height: 50,
              width: 50,
            ),
            SizedBox(
                height: 60,
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(Routes.LOGIN);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 0, 183, 255),
                        elevation: 5,
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.all(20)),
                    child: Text('LOGIN'))),
            SizedBox(
              height: 10,
              width: 10,
            ),
            SizedBox(
                height: 60,
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(Routes.REGISTER);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 0, 183, 255),
                        elevation: 5,
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.all(20)),
                    child: Text('REGISTER')))
          ],
        ),
      ),
    );
  }
}
