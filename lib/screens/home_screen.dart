import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groplus/Models/grocery_model.dart';
import 'package:groplus/contatrains/grcery.items.dart';
import 'package:groplus/screens/upload_item.dart';
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
  var firestore = FirebaseFirestore.instance;
  bool isLoading= false;
  List<Items> itemslist=[];
    GrocceryItem item = GrocceryItem();
    void fetchData() async
{
  setState(() {
    isLoading =true;

  });
  try{
    var snapshort = await firestore.collection("products").get();
    itemslist=
    snapshort.docs.map((docs)=> Items.fromMap(docs.data())).toList();
    setState(() {
      isLoading=false;
    });

    
  }catch(e){
    debugPrint("Error while fetching data:$e");
  }
}  
@override
  void initState() {
    fetchData();
    super.initState();
  }  
  @override
  Widget build(BuildContext context) {
    return isLoading?
    Center(
      child: CircularProgressIndicator(),
    ):
    Scaffold(
       floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (c) => UploadItem()));
              },
              child: Icon(Icons.add),
            ),
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
          const SizedBox(height: 12,),
           
        itemslist.isEmpty?Center(child: const Text('no products to show'),):   Expanded(
             child: GridView.builder(
              itemCount: itemslist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
             crossAxisSpacing: 10,mainAxisSpacing: 15),
              itemBuilder: (context, index) {
                return CardWidget(
                    imageUrl: itemslist[index].imageUrl,
                    Title: itemslist[index].name,
                    rating: "0",
                    );
                
                

              
             },),
           )
            ],
            
          
             
             
          ),
        )),
    );
  }
}