import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/utilites/shared_prefrences.dart';
import 'package:flutter_welcome_login_singup_screens/model/allProductModel.dart';

class CartProvider with ChangeNotifier {
  List<AllProduct> cartItems = [];

  addToCart(AllProduct product) {
    cartItems.add(product);
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