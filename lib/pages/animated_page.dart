import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:golden_store/pages/login_page.dart';

class AnimatedPage extends StatelessWidget {
  const AnimatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/grocery.png'),
      disableNavigation: false,
      nextScreen: MyLogin(),
      splashIconSize: 150,
      backgroundColor: Colors.indigo.shade700,
      splashTransition: SplashTransition.slideTransition,
      animationDuration: Duration(seconds: 2),
      curve: Curves.bounceOut,
      duration: 1500,
    );
  }
}
