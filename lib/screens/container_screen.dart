import 'package:flutter/material.dart';

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.amber,
            
          ),
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.blue,
          ),
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.blue,
          ),
          
        ],
      )),
    );
  }
}