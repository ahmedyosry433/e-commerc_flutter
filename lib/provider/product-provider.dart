import 'package:flutter/foundation.dart';

import '../model/product-model.dart';

class ProductListProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void setProducts(List<Product> productList) {
    _products = productList;
    notifyListeners();
  }
}
