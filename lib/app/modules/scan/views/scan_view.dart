import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../routes/app_pages.dart';
import '../controllers/scan_controller.dart';

class ScanView extends StatefulWidget {
  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  final ScanController myController = Get.put(ScanController());
  File? _image;
  Future<void> openCamera() async {
    //fuction openCamera();
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      // tempat untuk set state image
      _image = File(pickedImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Selamat Datang di ATLET",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed(Routes.DASHBOARD);
          },
        ),
      ),
      body: Container(
        child: Center(
          child: _image == null ? Text("No Image") : Image.file(_image!),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add_a_photo,
            color: Colors.white,
          ),
          backgroundColor: Colors.green,
          onPressed: () {
            openCamera();
          }),
    );
  }
}
