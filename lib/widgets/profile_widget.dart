import 'package:flutter/material.dart';
import 'package:groplus/contatrains/colors.dart';

class ProfileWidget extends StatelessWidget {
  final IconData leadingicon;
  final String text;
  final Function () ontab;
  const ProfileWidget({
    super.key, required this.leadingicon, required this.text, required this.ontab
    });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontab,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(height:50, width: 50,color: AppColors.primaryColor, child: Icon(leadingicon)),
                const SizedBox(width: 8,),
                Text(text),
              ],
            ),
            Icon(Icons.arrow_forward_ios),
        
           
          ],
        
          
        
          
        ),
      ),
    );
  }
}