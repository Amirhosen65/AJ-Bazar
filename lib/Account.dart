import 'package:ecommerce/Auth/LogInPage.dart';
import 'package:ecommerce/Auth/forgot_password.dart';
import 'package:ecommerce/BottomBar.dart';
import 'package:ecommerce/popup_menu_item/About.dart';
import 'package:ecommerce/popup_menu_item/contact.dart';
import 'package:ecommerce/test_cart/screens/cart_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;

  User? user = FirebaseAuth.instance.currentUser;

  verifyEmail() async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
      print('Verification Email has benn sent');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.deepOrange.shade700,
          content: Text(
            'Verification Email has been sent',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade700,
        title: Text("Account"),
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
          ListTile(
            title: Text('User ID',
              style: TextStyle(fontSize: 18.0),),
            subtitle: SelectableText('$uid'),
            leading: Icon(Icons.all_inclusive),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Email',
              style: TextStyle(fontSize: 18.0),
            ),
            subtitle: SelectableText('$email'),
            leading: Icon(Icons.mail),
            trailing: user!.emailVerified
                ? Text(
              'Verified',
              style: TextStyle(fontSize: 18.0, color: Colors.green.shade700),
            )
                : TextButton(
                  onPressed: () => {verifyEmail()},
                  child: Text('Verify',
                style: TextStyle(color: Colors.deepOrange.shade700),)),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Created Time',
              style: TextStyle(fontSize: 18.0),
            ),
            subtitle: SelectableText('$creationTime'),
            leading: Icon(Icons.access_time),
          ),
          Divider(),
          SizedBox(height: 5,),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
            },
            child: Text('Change Password'),
            style: ElevatedButton.styleFrom(primary: Colors.green),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () async => {
              await FirebaseAuth.instance.signOut(),
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                      (route) => false)
            },
            child: Text('Logout'),
            style: ElevatedButton.styleFrom(primary: Colors.deepOrange.shade700),
          ),
        ],
      ),
    );
  }
}
