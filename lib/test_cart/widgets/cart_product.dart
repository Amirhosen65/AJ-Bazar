
import 'package:ecommerce/AllData.dart';
import 'package:ecommerce/test_cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Cartproducts extends StatelessWidget {
  final CartController controller = Get.find();

  Cartproducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Obx(()
         => SizedBox(
        height: 600,
        child: ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (BuildContext context, int index){
            return CartProductCard(
              controller: controller,
              product: controller.products.keys.toList()[index],
              quantity: controller.products.values.toList()[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}



class CartProductCard extends StatelessWidget {
  final CartController controller;
  final DetailsOfUser product;
  final int quantity;
  final int index;

  const CartProductCard({
    Key? key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
             horizontal: 20.0,
             vertical: 10.0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(
              product.productImage,
            ),
            backgroundColor: Colors.white,
          ),
          SizedBox(width: 20,),
          Expanded(child: Text(product.productTitle)),
          IconButton(onPressed: (){

            controller.removeProduct(product);

          }, icon: Icon(Icons.remove_circle, color: Colors.deepOrange.shade700)),
          Text('${quantity}'),
          IconButton(onPressed: (){
            controller.addProduct(product);

          }, icon: Icon(Icons.add_circle, color: Colors.deepOrange.shade700,)),

        ],
      ),
    );
  }
}
