import 'package:ecommerce/AllData.dart';
import 'package:get/get.dart';


class CartController extends GetxController {
  /// add a dictionary to to store the product into the test_cart
  var _products = {}.obs;

  void addProduct(DetailsOfUser product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    Get.snackbar(
        "Product Added", "You Have added the ${product.productTitle} to the Cart",
        snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
  }

  void removeProduct(DetailsOfUser product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;

  get ProductSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
