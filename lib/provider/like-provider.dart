import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_welcome_login_singup_screens/model/allProductModel.dart';

class LikeButtonProvider with ChangeNotifier {
  List<Product> likesItem = [];
  bool isLike = false;
  addLike(Product product) {
    final existLike = likesItem.firstWhereOrNull(
      (item) => item.id == product.id,
    );
    if (existLike == null) {
      likesItem.add(product);
      isLike = true;
    }
    notifyListeners();
  }

  removeLike(Product product) {
    final existLike = likesItem.firstWhereOrNull(
      (item) => item.id == product.id,
    );
    if (existLike != null) {
      likesItem.removeWhere((item) => item.id == product.id);
      isLike = false;
    }
    notifyListeners();
  }

  bool isLiked(int id) {
    return likesItem.firstWhereOrNull(
          (item) => item.id == id,
        ) !=
        null;
  }
}
