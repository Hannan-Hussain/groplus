import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groplus/Models/grocery_model.dart';
import 'package:groplus/screens/Nav_Bottombar.dart';
import 'package:groplus/widgets/loading_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class UploadItemsController extends GetxController {
  var auth = FirebaseAuth.instance;
  var firestore = FirebaseFirestore.instance;
  var pickedImage = Rxn<XFile>();
  var imagePicker = ImagePicker();

  // Pick image from camera
  Future<void> pickImage() async {
    try {
      final XFile? selectedImage =
          await imagePicker.pickImage(source: ImageSource.camera);
      if (selectedImage != null) {
        pickedImage.value = selectedImage;
      }
    } catch (e) {
      debugPrint("Error while picking image: $e");
    }
  }

 
  Future<String> uploadImageToFirebaseStorage(XFile file) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('product_images')
          .child('${Uuid().v4()}.jpg');

      UploadTask uploadTask = ref.putFile(File(file.path));
      TaskSnapshot snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw Exception("Image upload failed: $e");
    }
  }


  Future<void> uploadData(String name, String description, String price) async {
    try {
      if (pickedImage.value == null) {
        Get.snackbar("Error", "Please select an image");
        return;
      }

      Get.dialog(LoadingDialogWidget(), barrierDismissible: false);

      var imageUrl = await uploadImageToFirebaseStorage(pickedImage.value!);
      var productId = Uuid().v1();

      Items items = Items(
        name: name,
        imageUrl: imageUrl,
        descritpion: description,
        price: price,
        productId: productId,
      );

      await firestore
          .collection("products")
          .doc(productId)
          .set(items.toJson());

      Get.back(); 
      Get.to(() => BottomNavBar());
      Get.snackbar(
        "Uploaded",
        "Item uploaded successfully",
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      Get.back(); 
      Get.snackbar(
        "Error",
        "Failed to upload item: $e",
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
