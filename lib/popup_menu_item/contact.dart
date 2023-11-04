
import 'package:ecommerce/popup_menu_item/About.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/BottomBar.dart';
import 'package:ecommerce/test_cart/screens/cart_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  String get url => "https://www.facebook.com/amirhosen.65";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
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
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 280,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/logo/Amir.jpg"))
                ),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              title: Text("Md: Amir Hossain"),
              subtitle: Text("Developer"),
              leading: CircleAvatar(
                backgroundImage: AssetImage("images/banner/Logo.jpg"),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: InkWell(
              onTap: () async {
                final phone = '+8801787-944065';
                final url = 'tel:$phone';

                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
              child: ListTile(
                title: Text("Call Now"),
                leading: Icon(Icons.phone),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: InkWell(
              onTap: ()async{
                final toEmail = 'amirhosen669222@gmail.com';
                final url = 'mailto:$toEmail';

                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
              child: ListTile(
                title: Text("Contact Mail"),
                leading: Icon(Icons.mail_outline),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: InkWell(
              onTap: () {
                launch("https://www.facebook.com/amirhosen.65");
              },
              child: ListTile(
                title: Text("Facebook"),
                leading: Icon(Icons.facebook),
              ),
            ),
          ),

        ],
      ),

    );
  }
}
