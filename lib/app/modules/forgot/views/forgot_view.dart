import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/forgot_controller.dart';

class ForgotView extends GetView<ForgotController> {
  const ForgotView({Key? key}) : super(key: key);
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
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: CachedNetworkImageProvider(
                    "https://scontent-cgk1-2.xx.fbcdn.net/v/t1.15752-9/341268773_983540346342334_6163509376536027785_n.png?stp=dst-png_p1080x2048&_nc_cat=100&ccb=1-7&_nc_sid=ae9488&_nc_eui2=AeFa-Fda47dyT4xdE9LxILz03-LMBfvL8A3f4swF-8vwDYSFBe7B6FqJTVmCF9VtPZTnh4RQ-aeTYpV5kB57vR5x&_nc_ohc=xq5ELg0rqEUAX9J1IC3&_nc_ht=scontent-cgk1-2.xx&oh=03_AdSvGU4w7pOxqX9VC-OI91J95BvoiMAjLDTzk4waB285MA&oe=64645EDC"),
                width: 300,
                height: 300,
              ),
              Text(
                  "Lupa Kata Sandi Anda ?\n \nJangan khawatir, Tulis Email anda dan kami akan mengirimkan email reset password!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 10,
                width: 10,
              ),
              TextField(
                controller: null,
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
              SizedBox(
                  height: 50,
                  width: 290,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          elevation: 5,
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.all(20)),
                      child: Text('Reset Password')))
            ],
          ),
        ));
  }
}
