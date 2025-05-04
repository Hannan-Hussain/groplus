import 'package:flutter/material.dart';

class FavoriteCardWidget extends StatelessWidget {
  final dynamic item; // or use your model class instead of dynamic

  const FavoriteCardWidget({super.key, required this.item});

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
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Product Name",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      "Product Description",
                      style: TextStyle(fontSize: 12, color: Colors.black12),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Icon(Icons.delete),
                const SizedBox(height: 12),
                Icon(Icons.card_travel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
