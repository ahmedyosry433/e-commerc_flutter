import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/model/allProductModel.dart';

class CartProvider with ChangeNotifier {
  List<AllProduct> cartItems = [];
  
  addToCart(AllProduct product) {
    cartItems.add(product);
    notifyListeners();
  }
}
