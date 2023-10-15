// ignore_for_file: unused_field, file_names

import 'package:flutter/foundation.dart';

import '../model/product-model.dart';

class ProductListProvider with ChangeNotifier {
  List<Product> _products = [];
  List _category = [];

  List<Product> get products => _products;

  void setProducts(List<Product> productList) {
    _products = productList;
    notifyListeners();
  }

  List get getcategory => _category;

  void setcategoies(List category) {
    _category = category;
    notifyListeners();
  }
}
