// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/model/allProductModel.dart';
import 'package:collection/collection.dart';

class CartProvider with ChangeNotifier {
  List<AllProduct> cartItems = [];

  int countQuantity = 1;

  incrementQuantity() {
    countQuantity++;
    notifyListeners();
  }

  decreaseQuantity() {
    if (countQuantity > 1) {
      countQuantity--;
    }
    notifyListeners();
  }

  addToCart({required AllProduct newProduct}) {
    final AllProduct? existingItem = cartItems.firstWhereOrNull(
      (item) => item.id == newProduct.id,
    );
    if (existingItem != null) {
      existingItem.quantity++;
    } else {
      cartItems.add(newProduct);
    }
    notifyListeners();
  }
}




// addToCart(AllProduct product) async {
//     cartItems
//         .add({'title': product.title, 'price': product.price, 'quantity': 1});
//     // Convert rthe list to a JSON string
//     final jsonString = jsonEncode(cartItems);
//     SharedPrefrenceHelper().setValueForKey('CART', jsonString);

//     notifyListeners();
//   }

//   getUserCart() async {
//     String res = await SharedPrefrenceHelper().getValueForKey('CART');
//     List items = jsonDecode(res) as List;
//     // final productList = items.map((json) => Product.fromJson(json)).toList();

//     // return productList;
//   }

//   isProductExistAtCart(newproduct) {
    

//   }