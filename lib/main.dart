import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:golden_store/Navbar/nav_page.dart';
import 'package:golden_store/Navbar/profile_page.dart';
import 'package:golden_store/pages/animated_page.dart';
import 'package:golden_store/pages/forgot_page.dart';
import 'package:golden_store/pages/login_page.dart';
import 'package:golden_store/pages/register_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final storage = FlutterSecureStorage();

  Future<bool> checkLoginStatus() async {
    String? value = await storage.read(key: "email");
    if (value == null) {
      return false;
    } else
      return true;
  }

  ;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/Animated",
      routes: {
        '/Animated': (context) => AnimatedPage(),
        '/Profile': (context) => Profile(),
        '/home': (context) => MyLogin(),
        '/forgot': (context) => ChangePassword(),
        '/register': (context) => MyRegister(),
        '/nav': (context) => NavPage(),
      },
      home: FutureBuilder(
          future: checkLoginStatus(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == false) {
              return MyLogin();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  color: Colors.white,
                  child: Center(child: CircularProgressIndicator()));
            }
            return NavPage();
          }),
    ),
  );
}
