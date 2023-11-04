import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/BottomBar.dart';
import 'package:ecommerce/popup_menu_item/About.dart';
import 'package:ecommerce/popup_menu_item/contact.dart';
import 'package:ecommerce/AllCategory.dart';
import 'package:ecommerce/AllData.dart';
import 'package:ecommerce/AllProducts.dart';
import 'package:ecommerce/ProductDetails.dart';
import 'package:ecommerce/test_cart/screens/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  List<DetailsOfUser> userdata = DetailsOfUser.BrandProduct;
   Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade700,
        title: Center(child: Text("AJ Bazar")),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
          }, icon: Icon(Icons.shopping_cart)),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 5,
                child: CupertinoSearchTextField(),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5,),
                child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      height: size.height*.28,
                      viewportFraction: 1.00
                  ),
                  items: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage("images/banner/imgg.png"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage("images/banner/img_1.png"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage("images/banner/img_2.png"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 100,
              width: size.width*.99,
              decoration: BoxDecoration(),
              child: ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context,index) {
                    return InkWell(
                      onTap: (){},
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(DetailsOfUser.BrandProduct[index].serImage),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(DetailsOfUser.BrandProduct[index].brandName,maxLines: 3),
                          ),

                        ],
                      ),
                    );
                  }
              ),
            ),
            Divider(),
            Container(
              child: Table(
                columnWidths: {1: FlexColumnWidth(.4)},
                children: [
                  TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Category", style: TextStyle(fontSize: 25),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5,),
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AllCategory(index: 0,)));
                        },
                        child: Text("See All>", style: TextStyle(fontSize: 18, color: Colors.deepOrange.shade700),),
                      ),
                    ),
                  ],
                ),]
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AllCategory(index: 0,)));
              },
              child: Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Container(
                        height: size.height*.13,
                        width: size.width*.22,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage("images/product/Toast.jpg"),
                                fit: BoxFit.fill
                            ),
                            boxShadow: const[
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(2,0),
                                  blurRadius: 5,
                                  spreadRadius: 5
                              )]
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        height: size.height*.13,
                        width: size.width*.22,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage("images/product/Phone.png"),
                                fit: BoxFit.fill
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(2,0),
                                  blurRadius: 5,
                                  spreadRadius: 5
                              )]
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        height: size.height*.13,
                        width: size.width*.22,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage("images/product/Light.jpg"),
                                fit: BoxFit.fill
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(2,0),
                                  blurRadius: 5,
                                  spreadRadius: 5
                              )]
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        height: size.height*.13,
                        width: size.width*.22,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage("images/product/Ladies.jpg"),
                                fit: BoxFit.fill
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(2,0),
                                  blurRadius: 5,
                                  spreadRadius: 5
                              )]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AllCategory(index: 0,)));
              },
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          height: size.height*.13,
                          width: size.width*.22,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: AssetImage("images/product/Heel.jpg"),
                                  fit: BoxFit.fill
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(2,0),
                                    blurRadius: 5,
                                    spreadRadius: 5
                                )]
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          height: size.height*.13,
                          width: size.width*.22,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: AssetImage("images/product/Earphone.jpg"),
                                  fit: BoxFit.fill
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(2,0),
                                    blurRadius: 5,
                                    spreadRadius: 5
                                )]
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          height: size.height*.13,
                          width: size.width*.22,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: AssetImage("images/product/Product1.jpg"),
                                  fit: BoxFit.fill
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(2,0),
                                    blurRadius: 5,
                                    spreadRadius: 5
                                )]
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          height: size.height*.13,
                          width: size.width*.22,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: AssetImage("images/product/Shirt.jpg"),
                                  fit: BoxFit.fill
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(2,0),
                                    blurRadius: 5,
                                    spreadRadius: 5
                                )]
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Global", style: TextStyle(fontSize: 25),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
                height: size.height*.15,
                width: size.width*1.00,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(image: AssetImage("images/banner/img_3.png"),
                  fit: BoxFit.fill)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Just For You", style: TextStyle(fontSize: 25),),
            ),
            Container(
              height: 270,
              width: size.width*.99,
              decoration: BoxDecoration(),
              child: ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context,index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder:  (contex)=> productDetails(detailsOfUser: DetailsOfUser.BrandProduct[index], index:index,)));
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: size.height * .30,
                              width: size.width * .45,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(DetailsOfUser.BrandProduct[index].productImage),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10),
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
                                            Text('৳${DetailsOfUser.BrandProduct[index].price}'),
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),
            TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AllProducts(index: 0,)));
                },
                child: Text("See All", style: TextStyle(fontSize: 18, color: Colors.deepOrange.shade700),)),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height * .30,
                    width: size.width * .45,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/product/Phone.png"),
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
                                      child: Text("Mobile Phone")
                                  ),
                                  Text("৳10490")
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height*.30,
                    width: size.width*.45,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/product/Watch.jpg"),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(2,0),
                              blurRadius: 5,
                              spreadRadius: 5
                          )]
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            bottom: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(100),
                                      bottomLeft: Radius.circular(20)
                                  )
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Analog Watch")
                                  ),
                                  Text("৳520")
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
                    },
                    child: Container(
                      height: size.height*.30,
                      width: size.width*.45,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/product/Phone.png"),
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
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(100),
                                        bottomLeft: Radius.circular(20)
                                    )
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Mobile Phone")
                                    ),
                                    Text("৳10490")
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height*.30,
                    width: size.width*.45,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/product/Watch.jpg"),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(2,0),
                              blurRadius: 5,
                              spreadRadius: 5
                          )]
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            bottom: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(100),
                                      bottomLeft: Radius.circular(20)
                                  )
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Analog Watch")
                                  ),
                                  Text("৳520")
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
                    },
                    child: Container(
                      height: size.height*.30,
                      width: size.width*.45,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/product/Phone.png"),
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
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(100),
                                        bottomLeft: Radius.circular(20)
                                    )
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Mobile Phone")
                                    ),
                                    Text("৳10490")
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height*.30,
                    width: size.width*.45,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/product/Watch.jpg"),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(2,0),
                              blurRadius: 5,
                              spreadRadius: 5
                          )]
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            bottom: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(100),
                                      bottomLeft: Radius.circular(20)
                                  )
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Analog Watch")
                                  ),
                                  Text("৳520")
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
                    },
                    child: Container(
                      height: size.height*.30,
                      width: size.width*.45,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/product/Phone.png"),
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
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(100),
                                        bottomLeft: Radius.circular(20)
                                    )
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Mobile Phone")
                                    ),
                                    Text("৳10490")
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height*.30,
                    width: size.width*.45,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/product/Watch.jpg"),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(2,0),
                              blurRadius: 5,
                              spreadRadius: 5
                          )]
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            bottom: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(100),
                                      bottomLeft: Radius.circular(20)
                                  )
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Analog Watch")
                                  ),
                                  Text("৳520")
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
                    },
                    child: Container(
                      height: size.height*.30,
                      width: size.width*.45,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/product/Phone.png"),
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
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(100),
                                        bottomLeft: Radius.circular(20)
                                    )
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Mobile Phone")
                                    ),
                                    Text("৳10490")
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height*.30,
                    width: size.width*.45,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/product/Watch.jpg"),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(2,0),
                              blurRadius: 5,
                              spreadRadius: 5
                          )]
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            bottom: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(100),
                                      bottomLeft: Radius.circular(20)
                                  )
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Analog Watch")
                                  ),
                                  Text("৳520")
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
