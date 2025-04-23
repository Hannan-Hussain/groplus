import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groplus/screens/Nav_Bottombar.dart';
import 'package:groplus/screens/login_screen.dart';
import 'package:groplus/screens/signup_screen%20(1).dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 final FirebaseAuth _auth = FirebaseAuth.instance;

      void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      User? currentUser = _auth.currentUser;

      if (currentUser != null && currentUser.emailVerified) {
        // User is logged in
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (c) => BottomNavBar()),
          (route) => false,
        );
      } else {
        // User is not logged in
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (c) => LoginScreen()),
          (route) => false,
        );
      }
    });
  }


  @override

  @override
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