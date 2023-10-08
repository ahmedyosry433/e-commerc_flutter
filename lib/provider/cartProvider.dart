// ignore_for_file: unnecessary_null_comparison, list_remove_unrelated_type, avoid_print, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/model/allProductModel.dart';
import 'package:collection/collection.dart';

import '../model/cart-item.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> cartItems = [];

  double totalCartPrice = 0;

  addToCart({required Product newProduct}) {
    final CartItem? existingItem = cartItems.firstWhereOrNull(
      (item) => item.productId == newProduct.id,
    );
    if (existingItem != null) {
      existingItem.quantity++;

      existingItem.totalPrice =
          existingItem.quantity * double.parse(newProduct.price.toString());
    } else {
      cartItems.add(CartItem(
          productId: newProduct.id,
          title: newProduct.title,
          totalPrice: newProduct.price,
          product: newProduct));
    }
    calcTotalCartPrice();
    notifyListeners();
    // totalCartPrice += existingItem!.product.price;
  }

  removeCart({required Product newProduct}) {
    final CartItem? existingItem = cartItems.firstWhereOrNull(
      (item) => item.productId == newProduct.id,
    );
    if (existingItem != null && existingItem.quantity >= 1) {
      existingItem.quantity--;
      existingItem.totalPrice =
          existingItem.quantity * double.parse(newProduct.price.toString());
      if (existingItem.quantity == 0) {
        cartItems.removeWhere((item) => item.productId == newProduct.id);
        print(
            "_________________FROM IF____quantity:${existingItem.quantity}&&lenght: ${cartItems.length}&& cartitem:$cartItems");
      }
    } else {
      cartItems.removeWhere((item) => item.productId == newProduct.id);
      print(
          "_____________FROM ELSE________quantity:${existingItem?.quantity}&&lenght: ${cartItems.length}&& cartitem:$cartItems");
    }
    print(
        "_____________________quantity:${existingItem?.quantity}&&lenght: ${cartItems.length}&& cartitem:$cartItems");
    notifyListeners();
    totalCartPrice -= existingItem!.product.price;
    // calcTotalCartPrice();
  }

  calcTotalCartPrice() {
    for (var i = 0; i < cartItems.length; i++) {
      totalCartPrice += cartItems[i].product.price;
      print('________$totalCartPrice');
    }
  }

  Future<void> saveCartInFirebase({required User user}) async {
    Product? newProduct;
    final cartFire = FirebaseFirestore.instance.collection('carts');

    await cartFire.doc(user.uid).set({
      'productId': newProduct!.id,
      'title': newProduct.title,
      'totalPrice': newProduct.price,
      'product': newProduct
    });
  }
}
