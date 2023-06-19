import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  static int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  static DashboardController _controller = Get.put(DashboardController());

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
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Get.offAllNamed(Routes.USER);
            },
            icon: Icon(Icons.person_4_rounded),
            color: Colors.orangeAccent,
          )
        ],
      ),
      body: Container(
        child: GridView.count(
          padding: const EdgeInsets.all(15),
          crossAxisCount: 2,
          children: <Widget>[
            Text("Silakan pilih aktivitas dibawah ini"),
            SizedBox(
              height: 5,
            ),
            Card(
              margin: const EdgeInsets.all(5),
              color: Color.fromARGB(255, 255, 189, 53),
              child: InkWell(
                onTap: () {
                  Get.offAllNamed(Routes.SCAN);
                },
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      ImageIcon(
                        CachedNetworkImageProvider(
                            'https://scontent-cgk1-1.xx.fbcdn.net/v/t1.15752-9/340858445_682991510299450_7727459497255543264_n.png?stp=dst-png_p1080x2048&_nc_cat=101&ccb=1-7&_nc_sid=ae9488&_nc_eui2=AeHJ6ruU7xbjQomiSeAln41LZiL6Jp_uWmpmIvomn-5aai4sUz9fFxhIryUL_y7NtlCEa62WouKpAX04W_c355WE&_nc_ohc=AmLShb1GnAsAX8BsNDM&_nc_ht=scontent-cgk1-1.xx&oh=03_AdRktRVhsq1JsjTvwdEsw0wOSgr3uyJabXq_q1yG0VQlnw&oe=6494F204'),
                        size: 100,
                        color: Colors.white,
                      ),
                      Text("Scan",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(8),
              color: Color.fromARGB(240, 240, 93, 72),
              child: InkWell(
                onTap: () {
                  Get.offAllNamed(Routes.INFO);
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.newspaper,
                        size: 70,
                        color: Colors.white,
                      ),
                      Text("Info",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(8),
              color: Color.fromARGB(255, 255, 208, 154),
              child: InkWell(
                onTap: () {
                  Get.offAllNamed(Routes.MAKANAN);
                },
                splashColor: Colors.orangeAccent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.food_bank,
                        size: 70,
                        color: Colors.white,
                      ),
                      Text("Makanan",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(8),
              color: Color.fromRGBO(144, 144, 255, 1),
              child: InkWell(
                onTap: () {
                  Get.offAllNamed(Routes.PROFILE);
                },
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(
                        Icons.bookmark,
                        size: 70,
                        color: Colors.white,
                      ),
                      Text("Profile",
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
