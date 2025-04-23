// import 'package:flutter/material.dart';
// import 'package:groplus/widgets/primary_button.dart';


// class Screen04 extends StatefulWidget {
//   const Screen04({super.key});

//   @override
//   State<Screen04> createState() => _Screen04State();
// }

// class _Screen04State extends State<Screen04> {
//   bool _isObscured = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Image
//               Center(
//                 child: Image.asset(
//                   "assets/dice2.jpg",
//                   height: 200,
//                   width: double.infinity,
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Small title text
//               const Text(
//                 "Enter the password",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               // Description text
//               const Text(
//                 "It looks like you already have an account with this number. Please enter the password to proceed.",
//                 style: TextStyle(color: Colors.black),
//               ),
//               const SizedBox(height: 20),
//               // Password input with eye icon
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: "Password",
//                   prefixIcon: const Icon(Icons.lock),
//                   suffixIcon: IconButton(
//                     icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
//                     onPressed: () {
//                       setState(() {

//                         _isObscured = !_isObscured;
//                       });
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),

//               // Forgot Password? (Right Aligned)
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: TextButton(
//                   onPressed: () {
//                     // Forgot password functionality
//                   },
//                   child: const Text("Forgot Password?"),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Primary "Next" Button
             
//                  PrimaryButton(
//                       title: "Next",
//                       icon: Icons.arrow_forward,
//                       ontap: () {
//                         setState(() {

                          
//                         });
//                       }, 
//                     ),
            
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }