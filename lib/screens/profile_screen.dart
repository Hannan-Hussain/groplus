import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groplus/screens/login_screen.dart';
import 'package:groplus/widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout() async {
    try {
      await _auth.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint("Error during logout: ${e.code}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/dice6.jpg"),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Hannan_Hussain",
                  style: TextStyle(color: Colors.amberAccent, fontSize: 16),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Hannan123@gmail.com",
                  style: TextStyle(
                    color: Color.fromARGB(255, 13, 13, 12),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 50),
                ProfileWidget(
                  leadingicon: Icons.logout,
                  text: "Logout",
                  ontab: logout,
                ),
                const SizedBox(height: 30),
                ProfileWidget(
                  leadingicon: Icons.carpenter_sharp,
                  text: "Cart",
                  ontab: () {},
                ),
                const SizedBox(height: 30),
                ProfileWidget(
                  leadingicon: Icons.shopping_bag,
                  text: "Shopping",
                  ontab: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
