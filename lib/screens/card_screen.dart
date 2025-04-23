import 'package:flutter/material.dart';
import 'package:groplus/widgets/card__2_widget.dart';
import 'package:groplus/widgets/primary_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:PrimaryButton(title:"Buy Now", icon: Icons.shopping_bag, ontap: (){}),
      body: SafeArea(
        child: ListView.builder(
          itemCount:10,
         itemBuilder: (context, index){

return card_widget();
         }

          )),
    );
  }
}