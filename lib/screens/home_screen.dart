import 'package:flutter/material.dart';
import 'package:groplus/contatrains/grcery.items.dart';
import 'package:groplus/widgets/Location_widget.dart';
import 'package:groplus/widgets/card_widget.dart';
import 'package:groplus/widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final TextEditingController searchController=TextEditingController();
//  var searchController = TextEditingController();
    GrocceryItem item = GrocceryItem();
    
      get fontSize => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Grocery Plus", style:TextStyle(fontSize: 20)),
          
                      Icon(Icons.notification_add_outlined)
                ],
                
              ),
               const SizedBox(
            height: 10,
          ),

          LocationWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),

          CustomTextField(hintText:" Search here", prefixIcon: Icon(Icons.search), controller:searchController,),
           
           Expanded(
             child: GridView.builder(
              itemCount: item.vegtable.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
             crossAxisSpacing: 10,mainAxisSpacing: 15),
              itemBuilder: (context, index) {
                return CardWidget(
                    imageUrl: item.vegtable[index]['image'],
                    Title: item.vegtable[index]['title'],
                    rating: item.vegtable[index]['rating'],
                    );
                
                

              
             },),
           )
            ],
            
          
             
             
          ),
        )),
    );
  }
}