import 'package:ecommerce/AllData.dart';
import 'package:ecommerce/BottomBar.dart';
import 'package:ecommerce/order_page.dart';
import 'package:ecommerce/popup_menu_item/About.dart';
import 'package:ecommerce/popup_menu_item/contact.dart';
import 'package:ecommerce/test_cart/controllers/cart_controller.dart';
import 'package:ecommerce/test_cart/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'AllData.dart';


class productDetails extends StatelessWidget {
  final int index;
  final cartController = Get.put(CartController());
  final DetailsOfUser detailsOfUser;
  productDetails({Key? key, required this.detailsOfUser, required this.index,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade700,
        title: Text("Product Details"),
        actions: [
          IconButton(onPressed: () => Get.to(()=> CartScreen()),
              icon: Icon(Icons.shopping_cart)),
          PopupMenuButton(
              color: Colors.white,
              itemBuilder: (context) =>[
                PopupMenuItem(child: Column(
                  children: [
                    ListTile(
                      title: Text("Home"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomBar()));
                      },
                    ),
                    ListTile(
                      title: Text("Privacy Policy"),
                      onTap: () async {
                        final url=("https://www.app-privacy-policy.com/live.php?token=2xMfhXognKmGXQCfd249Xqsg7UBOlpWX");
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceWebView: true,
                            enableJavaScript: true,
                          );
                        }
                      },
                    ),
                    ListTile(
                        title: Text("Terms&Conditions"),
                        onTap: () async {
                          final url = ("https://www.app-privacy-policy.com/live.php?token=y4WbeKYClIwOTkrAfS4GBUkLGKTCuPDy");
                          if (await canLaunch(url)) {
                            await launch(
                              url,
                              forceWebView: true,
                              enableJavaScript: true,
                            );
                          }
                        }
                    ),
                    ListTile(
                      title: Text("Contact"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Contact()));
                      },
                    ),
                    ListTile(
                      title: Text("About"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
                      },
                    ),
                  ],
                ))
              ])
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15,),
            Container(
              height: size.height*.40,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(detailsOfUser.productImage),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Divider(),
            Container(
              child: Table(
                columnWidths: {1: FlexColumnWidth(.2)},
                children: [
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('৳${detailsOfUser.price}',
                            style: TextStyle(fontSize: 25, color: Colors.deepOrange.shade700),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.share, color: Colors.deepOrange.shade700,),
                        )
                      ]
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(detailsOfUser.productTitle,
                style: TextStyle(fontSize: 18),),
            ),
            Divider(),
            Container(
              child: Table(
                columnWidths: {1: FlexColumnWidth(1.7)},
                children: [
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Brand:",
                            style: TextStyle(fontSize: 15, color: Colors.deepOrange.shade700),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Here Is The Brand Name",
                            style: TextStyle(fontSize: 15),),
                        )
                      ]
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              child: Table(
                columnWidths: {1: FlexColumnWidth(1.7)},
                children: [
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Delivery:",
                            style: TextStyle(fontSize: 15, color: Colors.deepOrange.shade700),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Available Delivery Area",
                            style: TextStyle(fontSize: 15, ),),
                        )
                      ]
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              child: Table(
                columnWidths: {1: FlexColumnWidth(1.7)},
                children: [
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Service:",
                            style: TextStyle(fontSize: 15, color: Colors.deepOrange.shade700),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("100% Original\n\n""Easy return policy\n\n""Warranty",
                            style: TextStyle(fontSize: 15),),
                        )
                      ]
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              child: Table(
                children: [
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Order_page()));
                              },
                              child: Text("Buy Now")),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: (){
                              cartController.addProduct(DetailsOfUser.BrandProduct[index]);
                            },
                            child: Text("Add to Cart"),
                            style: ElevatedButton.styleFrom(primary: Colors.deepOrange.shade700),
                          ),
                        ),
                      ]
                  )
                ],
              ),
            ),
            Divider(),

            Text("Description", style: TextStyle(fontSize: 18, color: Colors.deepOrange.shade700),),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(detailsOfUser.productDescription),
                )
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
