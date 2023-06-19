import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart';
import 'package:movie/app/routes/app_pages.dart';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:movie/email.dart';

class VerifyOtpController extends GetxController {
  final databaseName = 'silat'; // Nama database XAMPP Anda
  final tableName = 'users'; // Nama tabel dalam database

  void verifyOTP(String otp) async {
    var url =
        'http://10.0.0.11:5000/verifikasi'; // Ganti dengan URL endpoint Flask yang sesuai

    var body = {
      'otp': otp,
      'email': authdata.email
    }; // Data OTP yang akan dikirim

    // Mengirim permintaan POST ke endpoint Flask
    var response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(body),
    );
    print(response.body);
    if (response.statusCode == 200) {
      // OTP berhasil diverifikasi
      print('OTP diverifikasi dengan sukses.');
      await showPlatformDialog(
        context: Get.overlayContext!,
        builder: (_) => BasicDialogAlert(
          title: Text("OTP SUKSES"),
          content: Text("Silahkan Menuju halaman Login."),
          actions: <Widget>[
            BasicDialogAction(
              title: Text("OK"),
              onPressed: () {
                // Menutup AlertDialog dan pindah ke halaman OTP
                Get.back(); // Menutup AlertDialog
                Get.offAllNamed(Routes.LOGIN); // Pindah ke halaman OTP
              },
            ),
          ],
        ),
      );
      // Perbarui nilai kondisi pada database
      // Tambahkan tindakan yang diinginkan setelah verifikasi OTP berhasil
    } else {
      // Verifikasi OTP gagal atau terjadi kesalahan lainnya
      print('Verifikasi OTP gagal.');
    }
  }

  Future<void> updateConditionInDatabase(int conditionValue) async {
    final databaseFactory = databaseFactoryFfiWeb;
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    final database = await databaseFactory.openDatabase(path);
    await database.update(tableName, {'is_verified': conditionValue},
        where: 'is_verified = ?', whereArgs: [0]);

    await database.close();
  }
}
