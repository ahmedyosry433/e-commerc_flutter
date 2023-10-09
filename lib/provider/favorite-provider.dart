// ignore_for_file: file_names

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_welcome_login_singup_screens/model/product-model.dart';

class FavoriteProvider with ChangeNotifier {
  List<Product> likesItem = [];

  addLike(Product product) {
    likesItem.add(product);

    notifyListeners();
  }

  removeLike(Product product) {
    likesItem.removeWhere((item) => item.id == product.id);

    notifyListeners();
  }

  bool isLiked(int id) {
    return likesItem.firstWhereOrNull(
          (item) => item.id == id,
        ) !=
        null;
  }
}
