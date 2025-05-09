import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groplus/contatrains/colors.dart';
import 'package:groplus/controllers/upload_items_controller.dart';
import 'package:groplus/widgets/custom_text_field.dart';
import 'package:groplus/widgets/primary_button.dart';


class UploadItem extends StatefulWidget {
  const UploadItem({super.key});

  @override
  State<UploadItem> createState() => _UploadItemState();
}

class _UploadItemState extends State<UploadItem> {
    var nameController = TextEditingController();
  var diController = TextEditingController();
  var priceController = TextEditingController();
   var uploadItemController = Get.put(UploadItemsController());
 


  

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                  border: Border.all(color: AppColors.fontColor, width: 1),
                ),
                child: Obx(
                  () => uploadItemController.pickedImage.value != null
                      ? Image.file(
                          File(uploadItemController.pickedImage.value!.path),
                          fit: BoxFit.cover,
                        )
                      : Center(
                          child: InkWell(
                              onTap: () {
                                uploadItemController.pickImage();
                              },
                              child: Icon(Icons.add_a_photo)),
                        ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  hintText: "Enter Product Name", controller: nameController),
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
                  hintText: "Enter Product price", controller: priceController),
              const SizedBox(height: 50),
              PrimaryButton(
                  title: "Upload",
                  ontap: () {
                    uploadItemController.uploadData(nameController.text,
                        diController.text, priceController.text);
                    // uploadData();
                  })
            ],
          ),
        ),
      )),
    );
  }
}