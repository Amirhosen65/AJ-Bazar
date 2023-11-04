import 'package:ecommerce/BottomBar.dart';
import 'package:ecommerce/popup_menu_item/About.dart';
import 'package:ecommerce/popup_menu_item/contact.dart';
import 'package:ecommerce/test_cart/controllers/cart_controller.dart';
import 'package:ecommerce/test_cart/widgets/cart_product.dart';
import 'package:ecommerce/test_cart/widgets/cart_total.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class CartScreen extends StatefulWidget {
  final CartController controller = Get.put(CartController());
  CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart"),
        backgroundColor: Colors.deepOrange.shade700,
        actions: [
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
        ],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Cartproducts(),
            CartTotal()
          ],
        ),
      ),

    );
  }
}
