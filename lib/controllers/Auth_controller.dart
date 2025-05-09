import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groplus/Models/user_model.dart';
import 'package:groplus/screens/Nav_Bottombar.dart';
import 'package:groplus/screens/login_screen.dart';
import 'package:groplus/widgets/loading_widget.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  var fireStore = FirebaseFirestore.instance;

  Future<void> loginUser(String email, String password) async {
    try {
      Get.dialog(LoadingDialogWidget(), barrierDismissible: false);

      if (email.isEmpty || password.isEmpty) {
        Get.snackbar(
          "Error",
          "Please fill all the fields",
        );
        return;
      }
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null && userCredential.user!.emailVerified) {
        Get.offAll(() => BottomNavBar());
      } else {
        Get.snackbar("Error", "Please verify your email first",
            snackPosition: SnackPosition.BOTTOM);
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      debugPrint("this is the error${e.code}");
    } finally {
      Get.back();
    }
  }

  Future<void> registerUser(
      String email, String password, String name, String phoneNumber) async {
    try {
      Get.dialog(LoadingDialogWidget(), barrierDismissible: false);
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        userCredential.user!.sendEmailVerification();
        Get.snackbar("Verfied", "Verification email sent to $email",
            snackPosition: SnackPosition.TOP);
        // ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text("Verification email sent to ${email}")));
        UserModel userData = UserModel(
            uid: auth.currentUser!.uid,
            userName: name,
            email: email,
            phoneNumber: phoneNumber,
            profileUrl: ""
            );
        await fireStore
            .collection("Users")
            .doc(auth.currentUser!.uid)
            .set(userData.toMap());
        Get.to(() => LoginScreen());
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      debugPrint(e.code);
    } finally {
      Get.back();
    }
  }
}