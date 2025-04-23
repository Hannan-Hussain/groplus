import 'package:flutter/material.dart';
import 'package:groplus/widgets/favorite_card_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ListView.builder(itemCount: 10,
      itemBuilder: (context, index) {
        return FavoriteCardWidget();
      }
      ),
    ));
  }
}