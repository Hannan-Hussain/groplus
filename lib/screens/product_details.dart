import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groplus/Models/grocery_model.dart';
import 'package:groplus/widgets/primary_button.dart';

class ProductDetailScreen extends StatefulWidget {
  final Items items;
  const ProductDetailScreen({super.key, required this.items});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final firebase = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  bool isLoading = false;

  Future<void> addToCart() async {
    setState(() {
      isLoading = true;
    });

    try {
      await firebase
          .collection("Users")
          .doc(auth.currentUser!.uid)
          .collection('cartItems')
          .doc(widget.items.productId)
          .set(widget.items.toJson());

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Item added to cart"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Product Detail"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey, width: 1),
                image: DecorationImage(
                  image: NetworkImage(widget.items.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.items.name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.items.price,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.items.descritpion,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                InkWell(
                  onTap: addToCart,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(Icons.shopping_cart_checkout),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: PrimaryButton(
                    title: isLoading ? "Loading..." : "Buy Now",
                    ontap: addToCart,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
