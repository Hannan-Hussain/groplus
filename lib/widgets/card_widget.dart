import 'package:flutter/material.dart';
import 'package:groplus/contatrains/colors.dart';

class CardWidget extends StatelessWidget {
  final String Title;
  final String rating;
  final String imageUrl;
  const CardWidget(
      {super.key,
      required this.imageUrl,
       required this.Title,
        required this.rating,
      
});
  @override
  Widget build(BuildContext context) {
    return Container(

       height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.4,

       decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Image.network(
              imageUrl,
              height: 80,
            ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Title),
            Row(
              children: [
                Text("rating"),
                Icon(Icons.star,
                color: Colors.amber,size: 12,)
              ],
            )
          ],
         )
        ],
      ),
    );
     
}
}