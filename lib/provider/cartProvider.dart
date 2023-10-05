// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/utilites/shared_prefrences.dart';
import 'package:flutter_welcome_login_singup_screens/model/allProductModel.dart';
import 'package:collection/collection.dart';

import '../model/cart-item.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> cartItems = [];

  late int countQuantity = 0;
  double totalCartPrice = 0;
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

  addToCart({required Product newProduct}) {
    final CartItem? existingItem = cartItems.firstWhereOrNull(
      (item) => item.productId == newProduct.id,
    );
    if (existingItem != null) {
      existingItem.quantity++;
      print(newProduct.price is int);
      existingItem.totalPrice =
          existingItem.quantity * double.parse(newProduct.price.toString());
      // countQuantity = existingItem.quantity;
    } else {
      cartItems.add(CartItem(
          productId: newProduct.id,
          title: newProduct.title,
          totalPrice: newProduct.price,
          product: newProduct));
    }
    //calcTotalCartPrice();
    saveLocalStorage();
    notifyListeners();
  }

  removeCart({required Product newProduct}) {
    final CartItem? existingItem = cartItems.firstWhereOrNull(
      (item) => item.productId == newProduct.id,
    );
    if (existingItem != null) {
      if (existingItem.quantity == 1) {
        existingItem.quantity--;
        countQuantity = existingItem.quantity;
        if (existingItem.quantity < 1) {
          cartItems.remove(newProduct);
        }
      }
    } else {
      cartItems.remove(newProduct);
    }
    calcTotalCartPrice();
    notifyListeners();
  }

  calcTotalCartPrice() {
    for (var i = 0; i < cartItems.length; i++) {
      totalCartPrice += cartItems[i].totalPrice;
    }
  }

  saveLocalStorage() {
    final jsonString = jsonEncode(cartItems);
    SharedPrefrenceHelper().setValueForKey('CART', jsonString);
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