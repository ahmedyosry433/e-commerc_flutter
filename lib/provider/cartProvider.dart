// ignore_for_file: unnecessary_null_comparison, list_remove_unrelated_type, avoid_print

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

  savetoFirebase() {
    //   String uid = userCredential.user!.uid;
    // // Create a new User object with the provided data
    // User FirebaseCartItem = {
    // uid:uid,
    // cartItems:cartItems
    //
    // }

    // // Store the user's data in Firestore
    // await FirebaseFirestore.instance.collection('cart').doc(uid).set(cart.toJson());
  }

  getFormFirebase() {
    //   String uid = userCredential.user!.uid;
    // // Create a new User object with the provided data
    //  DocumentSnapshot userSnapshot =
    //     await FirebaseFirestore.instance.collection('cart').doc(uid).get();

    // if (userSnapshot.exists) {
    //   // User data found in Firestore
    //   return userSnapshot.data() as Map<String, dynamic>;
    // } else {
    //   // User data not found
    //   return null;
    // }
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
