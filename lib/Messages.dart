import 'package:ecommerce/BottomBar.dart';
import 'package:ecommerce/popup_menu_item/About.dart';
import 'package:ecommerce/popup_menu_item/contact.dart';
import 'package:ecommerce/test_cart/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Messeages extends StatefulWidget {
  const Messeages({Key? key}) : super(key: key);

  @override
  _MesseagesState createState() => _MesseagesState();
}

class _MesseagesState extends State<Messeages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade700,
        title: Text("Messeages"),
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
      body: Card(
        elevation: 5,
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index){
              return Card(
                elevation: 5,
                child: ListTile(
                  title: Text(index==0?
                                  "Samsung"
                    :index==1?
                    "realme"
                    :index==2?
                    "Bata"
                    :index==3?
                    "Lotto"
                    :index==4?
                    "itel"
                    :"Rayangs",
                    style: TextStyle(color: Colors.deepOrange.shade700,),),
                  subtitle: Text(
                (index==0?
                "Hlw"
                    :index==1?
                "Hlw"
                    :index==2?
                "Hlw"
                    :index==3?
                "Hlw"
                    :index==4?
                "Hlw"
                    :"Hlw")
                  ),
                  leading: CircleAvatar(
                    child: Text(index==0?
                    "Logo"
                        :index==1?
                    "Logo"
                        :index==2?
                    "Logo"
                        :index==3?
                    "Logo"
                        :index==4?
                    "Logo"
                        :"Logo",
                    ),
                    backgroundColor: Colors.deepOrange.shade700,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
