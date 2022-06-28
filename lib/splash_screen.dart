
import 'package:lottie/lottie.dart';
import 'package:Rentax/login_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(

      splash: Column(
        children: [
          Lottie.network
            ('https://assets5.lottiefiles.com/private_files/lf30_skwgamub.json'),
        ],
      ),
      backgroundColor: Colors.green.shade100,
      nextScreen: LoginPage(),
      splashIconSize: 500,
      duration: 4000,
      splashTransition: SplashTransition.slideTransition,
      //pageTransitionType: PageTransitionType.topToBottom,
    );
  }
}


