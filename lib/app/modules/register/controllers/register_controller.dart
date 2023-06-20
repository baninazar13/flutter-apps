import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movie/app/modules/verify_otp/views/verify_otp_view.dart';
import 'package:movie/app/routes/app_pages.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:movie/email.dart';

class RegisterController extends GetxController {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void registerUser(String firstname, String lastname, String email,
      String password, String confirmPassword) async {
    var url = 'http://192.168.1.6:5000/register';

    // Membuat body request dalam format JSON
    var body = {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    };
    authdata.email = email;

    // Mengirim permintaan POST ke endpoint Flask
    print(firstname);
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: json.encode(body));

    if (response.statusCode == 201) {
      // Registrasi berhasil
      print('Registrasi Berhasil. Silahkan cek email untuk verifikasi.');

      // Menampilkan AlertDialog
      await showPlatformDialog(
        context: Get.overlayContext!,
        builder: (_) => BasicDialogAlert(
          title: Text("Registrasi Berhasil"),
          content: Text("Silahkan cek email untuk verifikasi."),
          actions: <Widget>[
            BasicDialogAction(
              title: Text("OK"),
              onPressed: () {
                // Menutup AlertDialog dan pindah ke halaman OTP
                Get.back(); // Menutup AlertDialog
                Get.offAllNamed(Routes.VERIFY_OTP); // Pindah ke halaman OTP
              },
            ),
          ],
        ),
      );
    } else if (response.statusCode == 400) {
      // Kesalahan pada permintaan (misalnya password tidak cocok)
      print('Terjadi kesalahan: ${response.body}');
    } else {
      // Kesalahan lainnya
      print('Terjadi kesalahan saat melakukan registrasi.');
    }
  }
}
