import 'package:flutter/material.dart';
import 'package:groplus/widgets/custom_text_field.dart';
import 'package:groplus/widgets/primary_button.dart';

class UpdatePass extends StatefulWidget {
  const UpdatePass({super.key});

  @override
  State<UpdatePass> createState() => _UpdatePassState();
}

class _UpdatePassState extends State<UpdatePass> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isOldObscured = true;
  bool isNewObscured = true;
  bool isConfirmObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Update your Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Reset your password",
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
                const SizedBox(height: 24),

               Text("Old password"),
               SizedBox(height: 5,),
                CustomTextField(
                  hintText: "Old Password",
                  controller: oldPasswordController,
                  obscureText: isOldObscured,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isOldObscured ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isOldObscured = !isOldObscured;
                      });
                    },
                  ),


                ),



                
                const SizedBox(height: 16),

               Text("New password"),
               SizedBox(height: 5,),
                CustomTextField(
                  hintText: "New Password",
                  controller: newPasswordController,
                  obscureText: isNewObscured,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isNewObscured ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isNewObscured = !isNewObscured;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),

                Text("confirm password"),
                SizedBox(height: 5,),
                CustomTextField(
                  hintText: "Confirm Password",
                  controller: confirmPasswordController,
                  obscureText: isConfirmObscured,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isConfirmObscured ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isConfirmObscured = !isConfirmObscured;
                      });
                    },
                  ),
                ),
                const SizedBox(height:50),

               PrimaryButton(
                title: "Update password",
                ontap: () {
                  
                },
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
