import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:test/pages/main_home_page05.dart';
import 'package:test/pages/sign_up01.dart';

import 'join_screen.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: Center(
        child: Image.asset('assets/images/img.png'),
      ),
      screenFunction: () async {
        return sign_up();
      },
      duration: 1700,
      splashIconSize: 10000.0,
      splashTransition: SplashTransition.fadeTransition,
      // pageTransitionType: PageTransitionType.rightToLeftWithFade,
      animationDuration: Duration(seconds: 1),
    );
  }
}
