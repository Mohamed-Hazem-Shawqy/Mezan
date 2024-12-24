import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:mezan/constant/shared.dart';
import 'package:mezan/screnns/home.dart';
import 'package:mezan/screnns/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 400,
      splash: Column(
        children: [
          Image.asset(
            "assets/images/mizan.png",
            width: 300,
          ),
          const Text(
            'ميزان',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'Gulzar',
            ),
          )
        ],
      ),
      nextScreen:
          Pref.containsKeyData(key: 'email') ? const Home() : const Login(),
      backgroundColor: Colors.black,
      splashTransition: SplashTransition.scaleTransition,
      curve: Curves.easeOutBack,
      animationDuration: const Duration(seconds: 2),
    );
  }
}
