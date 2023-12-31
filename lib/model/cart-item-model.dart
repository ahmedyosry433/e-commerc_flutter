// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'package:flutter_welcome_login_singup_screens/model/product-model.dart';

class CartItem {
  final productId;
  final title;
  num totalPrice;
  int quantity;
  Product product;

  CartItem(
      {required this.productId,
      required this.title,
      required this.totalPrice,
      required this.product,
      this.quantity = 1});


      Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'totalPrice': totalPrice,
      'quantity': quantity,
      'product': product.toJson(), // Assuming Product class has a toJson method
    };
  }
}
