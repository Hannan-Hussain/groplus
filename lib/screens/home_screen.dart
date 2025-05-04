import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groplus/Models/grocery_model.dart';
import 'package:groplus/screens/product_details.dart';
import 'package:groplus/screens/upload_item.dart';
import 'package:groplus/widgets/Location_widget.dart';
// import 'package:groplus/widgets/card_widget.dart';
import 'package:groplus/widgets/cart_widget.dart';
import 'package:groplus/widgets/custom_text_field.dart';
import 'package:groplus/widgets/home_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  bool isLoading = false;
  List<Items> itemsList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    setState(() => isLoading = true);
    try {
      var snapshot = await firestore.collection("products").get();
      itemsList =
          snapshot.docs.map((doc) => Items.fromMap(doc.data())).toList();
    } catch (e) {
      debugPrint("Error while fetching data: $e");
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => UploadItem()));
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // App bar row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Grocery Plus",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Icon(Icons.notification_add_outlined),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LocationWidget(),
                    const SizedBox(height: 12),
                    CustomTextField(
                      hintText: "Search here",
                      prefixIcon: Icon(Icons.search),
                      controller: searchController,
                    ),
                    const SizedBox(height: 12),
                    // Product grid
                    Expanded(
                      child: itemsList.isEmpty
                          ? Center(child: Text('No products to show'))
                          : GridView.builder(
                              itemCount: itemsList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 15,
                                childAspectRatio: 0.7,
                              ),
                              itemBuilder: (context, index) {
                                var item = itemsList[index];
                                return HomeCardWidget(
                                  imageUrl: item.imageUrl,
                                  title: item.name,
                                  rating: '5',
                                  ontap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (c)=>ProductDetailScreen(items: item)));
                                  },
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
