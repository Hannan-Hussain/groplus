import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groplus/Models/grocery_model.dart';
import 'package:groplus/contatrains/colors.dart';
import 'package:groplus/screens/Nav_Bottombar.dart';
import 'package:groplus/widgets/custom_text_field.dart';
import 'package:groplus/widgets/primary_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class UploadItem extends StatefulWidget {
  const UploadItem({super.key});

  @override
  State<UploadItem> createState() => _UploadItemState();
}

class _UploadItemState extends State<UploadItem> {
    var nameController = TextEditingController();
  var diController = TextEditingController();
  var priceController = TextEditingController();
 
  XFile? imageFile;
  final ImagePicker picker = ImagePicker();
  bool isLoading = false;
  var firestore = FirebaseFirestore.instance;
  Future<void> pickImage() async {
    try {
      final XFile? selectedImage =
          await picker.pickImage(source: ImageSource.camera);
      setState(() {
        imageFile = selectedImage;
      });
    } catch (e) {
      debugPrint("Error while picking image: $e");
    }
  }

  void uploadData() async {
    setState(() {
      isLoading = true;
    });
    try {
      // var imageUrl = uploadImageToFirebaseStorage(imageFile!);
      var productId = Uuid().v1();
      Items items = Items(
          name: nameController.text,
          imageUrl: "https://wallpapercave.com/wp/wp2301560.jpg",
          descritpion: diController.text,
          price: priceController.text,
          productId: productId);
      await firestore.collection("products").doc(productId).set(items.toJson());
      Navigator.push(context, MaterialPageRoute(builder: (c)=>BottomNavBar()));
    } catch (e) {
      debugPrint("Error while uploading data: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
   void dispose() {
    nameController.dispose();
    diController.dispose();
    priceController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                        border:
                            Border.all(color: AppColors.fontColor, width: 1),
                      ),
                      child: imageFile != null
                          ? Image.file(
                              File(imageFile!.path),
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child: InkWell(
                                  onTap: () {
                                    pickImage();
                                  },
                                  child: Icon(Icons.add_a_photo)),
                            ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                        hintText: "Enter Product Name",
                        controller: nameController),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      hintText: "Enter Product description",
                      controller: diController,
                      maxLines: 4,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                        hintText: "Enter Product price",
                        controller: priceController),
                    const SizedBox(height: 50),
                    PrimaryButton(
                        title: "Upload",
                        ontap: () {
                          uploadData();
                        })
                  ],
                ),
              ),
      )),
    );
  }
}