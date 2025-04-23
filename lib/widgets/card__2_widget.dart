import 'package:flutter/material.dart';

class card_widget extends StatelessWidget {
  const card_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Row(
            children: [
               Image.asset("assets/splash_image.png", height: 100, width: 100),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Product Name",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  "Product Name",
                  style: TextStyle(fontSize: 12, color: Colors.black12),
                ),
              ],
            ),
            ],
           ),
          
            Icon(Icons.delete),
          ],
        ),
      ),
    );
  }
}
