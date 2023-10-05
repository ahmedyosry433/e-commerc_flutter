// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'package:flutter_welcome_login_singup_screens/model/allProductModel.dart';

class CartItem {
  final productId;
  final title;
  double totalPrice;
  int quantity;
  Product product;

  CartItem(
      {required this.productId,
      required this.title,
      required this.totalPrice,
      required this.product,
      this.quantity = 1});
}
