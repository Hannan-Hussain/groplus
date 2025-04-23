import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groplus/contatrains/colors.dart';
import 'package:groplus/screens/Nav_Bottombar.dart';
import 'package:groplus/screens/forget_password_screen.dart';
import 'package:groplus/screens/signup_screen%20(1).dart';
import 'package:groplus/widgets/custom_text_field.dart';
import 'package:groplus/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
   bool isLoading = false;

  Future<void>loginUser (String email, String password) async {
    setState(() {
      isLoading = true;
    });
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
if(userCredential.user!.emailVerified==false||_auth.currentUser?.uid==null){
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(

  "User not vertified or User not Exsist"
)));} else{
  Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (c) => BottomNavBar()),
        (route) => false,
      );
}
      
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Image.asset(
                "assets/splash_image.png",
                height: 100,
                width: 200,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome to ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.fontColor,
                        )),
                    Text("Grocery Plus",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        )),
                    const SizedBox(height: 10),
                    Text("Please Login to your Account!",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.fontGrayColor,
                        )),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.mail,
                        color: AppColors.primaryColor,
                      ),
                      controller: emailController,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors.primaryColor,
                      ),
                      controller: passwordController,
                      suffixIcon: const Icon(Icons.visibility_off),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (c) => ForgetPasswordScreen()),
                          );
                        },
                        child: const Text("Forget Password?"),
                      ),
                    ),
                    const SizedBox(height: 50),
                    PrimaryButton(
  title: "Next",
  icon: Icons.arrow_forward,
  ontap: () {
    loginUser(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
  },
),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an Account?"),
                        const SizedBox(width: 6),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (c) => SignUpScreen()),
                            );
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
