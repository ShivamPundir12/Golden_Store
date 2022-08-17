import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_store/Navbar/profile_page.dart';

import 'bucket_page.dart';
import 'home_page.dart';

class NavPage extends StatefulWidget {
  @override
  State<NavPage> createState() => _NavPage();
}

class _NavPage extends State<NavPage> {
  final pages = [
    Home(),
    BucketPage(),
    Profile(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedLabelStyle: TextStyle(fontSize: 10, color: Colors.white),
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.shade300,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.blueAccent.shade400,
              icon: Icon(CupertinoIcons.house_fill),
              label: "Home",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.deepPurpleAccent.shade200,
              label: "Cart",
              icon: Icon(CupertinoIcons.cart),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              backgroundColor: Colors.blue.shade400,
              icon: Icon(CupertinoIcons.person),
            ),
          ]),
    );
  }
}
