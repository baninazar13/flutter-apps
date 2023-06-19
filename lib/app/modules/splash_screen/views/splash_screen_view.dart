import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie/app/modules/home/views/home_view.dart';
import 'package:movie/app/modules/login/views/login_view.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterSplashScreen.fadeIn(
          backgroundColor: Colors.white,
          childWidget: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("assets/projektor.gif"),
          ),
          defaultNextScreen: LoginView(),
        ),
      ),
    );
  }
}
