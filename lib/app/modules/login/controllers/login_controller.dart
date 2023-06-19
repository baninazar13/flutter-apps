import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  // final username = ''.obs;
  // final password = ''.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser(String email, String password) async {
    var url = 'http://10.0.0.11:5000/login';

    // String email = "fahmi@gmail.com";
    // String password = "fahmi123";

    var body = {'email': email, 'password': password};
    print(email);
    print(password);
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: json.encode(body));

    if (response.statusCode == 200) {
      print("login berhasil");
      var responseData = json.decode(response.body);
      var token = responseData['token'];
      print("Token: $token");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      print(prefs);

      await showPlatformDialog(
        context: Get.overlayContext!,
        builder: (_) => BasicDialogAlert(
          title: Text("Login Berhasil"),
          content: Text("Silikan Klik OK untuk menuju ke halaman Dashboard"),
          actions: <Widget>[
            BasicDialogAction(
              title: Text("OK"),
              onPressed: () {
                // Menutup AlertDialog dan pindah ke halaman OTP
                Get.back(); // Menutup AlertDialog
                Get.offAllNamed(Routes.DASHBOARD); // Pindah ke halaman OTP
              },
            ),
          ],
        ),
      );
    } else if (response.statusCode == 400) {
      print("Terjadi kesalahan: ${response.body}");
    } else {
      print("terjadi kesalahan saat melakukan login");
    }
  }
}
