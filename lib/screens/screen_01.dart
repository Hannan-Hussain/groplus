import 'package:flutter/material.dart';


class Screenone extends StatefulWidget {
  const Screenone({super.key});

  @override
  State<Screenone> createState() => _ScreenoneState();
}

class _ScreenoneState extends State<Screenone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/splash_image.png",
              height: 200,
              width: double.infinity,
            ),
            Text(
              "Grocery Plus",
              style:TextStyle(fontSize: 25,
               
                color: Color(0xFF37474F),),
              ),
            
          ],),
        ),
        );
      
    
  }
}
