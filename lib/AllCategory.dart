import 'package:ecommerce/AllData.dart';
import 'package:ecommerce/BottomBar.dart';
import 'package:ecommerce/ProductDetails.dart';
import 'package:ecommerce/popup_menu_item/About.dart';
import 'package:ecommerce/popup_menu_item/contact.dart';
import 'package:ecommerce/test_cart/controllers/cart_controller.dart';
import 'package:ecommerce/test_cart/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:url_launcher/url_launcher.dart';

class AllCategory extends StatefulWidget {
  final cartController = Get.put(CartController());
  final int index;
  AllCategory({Key? key,  required this.index}) : super(key: key);

  @override
  _AllCategoryState createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade700,
        title: Text("All Category"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
          },
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
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 15,
              crossAxisCount: 2,
              crossAxisSpacing: 15,
            ),
            itemCount: 8,
            itemBuilder: (context, index){
              return
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder:  (contex)=> productDetails(detailsOfUser: DetailsOfUser.BrandProduct[index], index:index,)));
                  },
                  child: Container(
                    height: size.height * .30,
                    width: size.width * .45,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(DetailsOfUser.BrandProduct[index].productImage),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(2,0),
                              blurRadius: 5,
                              spreadRadius: 5
                          )]),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            bottom: 0,
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(100),
                                    bottomLeft: Radius.circular(20)
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(DetailsOfUser.BrandProduct[index].productTitle)
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                );
            }
        ),
      ),
    );
  }
}
