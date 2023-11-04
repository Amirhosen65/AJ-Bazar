import 'package:ecommerce/BottomBar.dart';
import 'package:ecommerce/popup_menu_item/contact.dart';
import 'package:ecommerce/test_cart/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Colors.deepOrange.shade700,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is a demo app for E-Commerce app."),
          )
        ],
      ),
    );
  }
}
