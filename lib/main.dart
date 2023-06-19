import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'app/routes/app_pages.dart';

void main() {
  sqfliteFfiInit();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movie Recommendation",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(fontFamily: 'FontAmarante'),
    ),
  );
}
