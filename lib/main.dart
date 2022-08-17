import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:golden_store/Navbar/nav_page.dart';
import 'package:golden_store/Navbar/profile_page.dart';
import 'package:golden_store/pages/login_page.dart';
import 'package:golden_store/pages/register_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/Profile': (context) => Profile(),
      '/home': (context) => MyLogin(),
      '/register': (context) => MyRegister(),
      '/nav': (context) => NavPage(),
    },
    home: AnimatedSplashScreen(
      splash: Image.asset('assets/grocery.png'),
      disableNavigation: false,
      nextScreen: MyLogin(),
      splashIconSize: 150,
      backgroundColor: Colors.indigo.shade700,
      splashTransition: SplashTransition.slideTransition,
      animationDuration: Duration(seconds: 2),
      curve: Curves.bounceOut,
      duration: 1500,
    ),
  ));
}
