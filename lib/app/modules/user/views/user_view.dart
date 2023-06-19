import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  UserView({Key? key}) : super(key: key) {
    Get.put(UserController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Profile",
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
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: CachedNetworkImageProvider(
                    "https://scontent-cgk1-1.xx.fbcdn.net/v/t1.15752-9/340858445_682991510299450_7727459497255543264_n.png?stp=dst-png_p1080x2048&_nc_cat=101&ccb=1-7&_nc_sid=ae9488&_nc_eui2=AeHJ6ruU7xbjQomiSeAln41LZiL6Jp_uWmpmIvomn-5aai4sUz9fFxhIryUL_y7NtlCEa62WouKpAX04W_c355WE&_nc_ohc=AmLShb1GnAsAX8BsNDM&_nc_ht=scontent-cgk1-1.xx&oh=03_AdRktRVhsq1JsjTvwdEsw0wOSgr3uyJabXq_q1yG0VQlnw&oe=6494F204"),
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 5,
                width: 5,
              ),
              ListTile(
                  leading: Icon(Icons.person, size: 50),
                  title: Text('First Name'),
                  subtitle: TextField(
                    controller: TextEditingController(
                        text: controller.userData['firstname'] ?? ''),
                  )),
              SizedBox(
                height: 5,
                width: 5,
              ),
              ListTile(
                leading: Icon(Icons.person, size: 50),
                title: Text('Last Name'),
                subtitle: TextField(),
              ),
              SizedBox(
                height: 5,
                width: 5,
              ),
              ListTile(
                leading: Icon(Icons.email, size: 50),
                title: Text('Email'),
                subtitle: TextField(),
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(onPressed: () {}, child: Text("Ganti Nama")),
              Text(
                  "Aplikasi ATLET ini masih tahap pengembangan, terima kasih\n Kunjungi Fiverr saya muhamadsyabani",
                  textAlign: TextAlign.center)
            ],
          ),
        ));
  }
}
