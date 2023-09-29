import 'package:flutter/material.dart';

class ProductDetailsProvider with ChangeNotifier {
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
}
