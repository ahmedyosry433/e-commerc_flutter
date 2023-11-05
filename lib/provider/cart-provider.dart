// ignore_for_file: unnecessary_null_comparison, list_remove_unrelated_type, avoid_print, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/model/product-model.dart';
import 'package:collection/collection.dart';

import '../model/cart-item-model.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> cartItems = [];

  num totalCartPrice = 0;

  addToCart({required Product newProduct}) async {
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
 
    saveCartItemInFirebase();
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
      }
    } else {
      cartItems.removeWhere((item) => item.productId == newProduct.id);
    }

    totalCartPrice -= existingItem!.product.price;
    // calcTotalCartPrice();
    saveCartItemInFirebase();
    notifyListeners();
  }

  calcTotalCartPrice() {
    for (var i = 0; i < cartItems.length; i++) {
      totalCartPrice += cartItems[i].product.price;
    }
  }

  Future<void> saveCartItemInFirebase() async {
    final user = FirebaseAuth.instance.currentUser;
    await clearUserCart(user?.uid);
    final userCartRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .collection('cart');
    for (var item in cartItems) {
      await userCartRef.add({
        'productId': item.productId,
        'title': item.title,
        'totalPrice': item.totalPrice,
        'quantity': item.quantity,
        'product': item.product.toJson(),
      });
    }
    await getUserCarts(user?.uid);
  }

  Future<void> getUserCarts(String? userUid) async {
    CollectionReference userCartRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userUid)
        .collection('cart');
    QuerySnapshot cartSnapshot = await userCartRef.get();
    List<CartItem> firebaseCartItems = cartSnapshot.docs.map((doc) {
      return CartItem(
        productId: doc['productId'],
        title: doc['title'],
        totalPrice: doc['totalPrice'],
        quantity: doc['quantity'],
        product: Product.fromJson(doc['product']),
        // product: Product(
        //   id: 'dd',
        //   price: 23,
        //   title: 're',
        //   description: '',
        //   quantity: 3,
        //   category: 'ee',
        //   image: 'null',
        //   rating: 12,
        // ),
      );
    }).toList();
    cartItems = firebaseCartItems;
  }

  Future<void> clearUserCart(String? userUid) async {
    CollectionReference userCartRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userUid)
        .collection('cart');
    WriteBatch batch = FirebaseFirestore.instance.batch();

    QuerySnapshot cartSnapshot = await userCartRef.get();
    for (QueryDocumentSnapshot doc in cartSnapshot.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
  }
}
