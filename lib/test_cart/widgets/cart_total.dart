import 'package:ecommerce/order_page.dart';
import 'package:ecommerce/test_cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();

  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()
    => Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total:',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              ),
              Text(
                '\৳${controller.total}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.deepOrange.shade700),
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Order_page()));
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.deepOrange.shade700),
                  child: Text("Checkout"))
            ],
          ),
        ),
      ),
    );
  }
}
