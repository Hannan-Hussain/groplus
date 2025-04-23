// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:grocerrypro/contatrains/colors.dart';
// import 'package:grocerrypro/widgets/custom_btn.dart';

// class Screenthree extends StatefulWidget {
//   const Screenthree({super.key});

//   @override
//   State<Screenthree> createState() => _ScreenthreeState();
// }

// class _ScreenthreeState extends State<Screenthree> {
//   final TextEditingController phoneController=TextEditingController();
//     String?name;
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(child: Column(
//         children: [
//           Image.asset("assets/mobile_image.png"),
//            const SizedBox(
//                 height: 20,),

// Padding(
//   padding: const EdgeInsets.all(8.0),
  
//   child: (Column(
//     children: [
//       Text("enter your phone number",
//        style: GoogleFonts.poppins(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500,
//                           color:AppColors.fontGrayColor,),),


//        SizedBox(height: 20,),

//        Text(
//                         "We need to verify you. We will send you a one time verification code. ",
//                         style: GoogleFonts.poppins(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color:AppColors.fontGrayColor,
//                         )),

//              CustomBtn(hintText: "phone Number", prefixIcon: Icon(Icons.call), controller: phoneController,),
//               SizedBox(height: 20,),
              
                         


//     ],
//   )),
// )
              
//         ],
//       )),
//     );
//   }
// }