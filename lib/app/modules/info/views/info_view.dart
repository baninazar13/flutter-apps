import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/info_controller.dart';

class InfoView extends GetView<InfoController> {
  const InfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Informasi",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed(Routes.DASHBOARD);
          },
        ),
      ),
      body: Card(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person_outline_sharp, size: 50),
            title: Text('DETEKSI GERAKAN'),
            subtitle: Text('Pukulan Bandul'),
          ),
          ListTile(
            leading: Icon(Icons.person_outline_sharp, size: 50),
            title: Text('DETEKSI GERAKAN'),
            subtitle: Text('Pukulan Lurus'),
          ),
        ],
      )),
    );
  }
}
