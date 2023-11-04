import 'package:ecommerce/Account.dart';
import 'package:ecommerce/homePage.dart';
import 'package:ecommerce/Messages.dart';
import 'package:ecommerce/notiFication.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  var currentIndex=0;
  final pages=[
    Homepage(),
    Messeages(),
    NotiFIcation(),
    Account(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepOrange,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text("Messages")),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active), title: Text("Notification")),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text("Account")),
        ],
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
      ),
      body: pages[
      currentIndex
      ],
    );
  }
}
