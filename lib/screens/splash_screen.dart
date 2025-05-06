import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:groplus/controllers/splash_controller.dart';
import 'package:groplus/screens/Nav_Bottombar.dart';
import 'package:groplus/screens/login_screen.dart';
import 'package:groplus/screens/signup_screen%20(1).dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override

  @override
   SplashController splashController = Get.put(SplashController());
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body:Center(
        child:  Image.asset(
                      "assets/splash_image.png",
                      scale: 3.0,
                    ),
      ),
    );
  }
}