// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_welcome_login_singup_screens/model/product-model.dart';

class FavoriteProvider with ChangeNotifier {
  List<Product> favoriteItems = [];

  addLike(Product product) {
    favoriteItems.add(product);
    saveFavoriteInFirebase();
    notifyListeners();
  }

  removeLike(Product product) {
    favoriteItems.removeWhere((item) => item.id == product.id);
    saveFavoriteInFirebase();
    notifyListeners();
  }

  bool isLiked(int id) {
    return favoriteItems.firstWhereOrNull(
          (item) => item.id == id,
        ) !=
        null;
  }

  final user = FirebaseAuth.instance.currentUser;

  Future<void> saveFavoriteInFirebase() async {
    await clearUserFavorite(user?.uid);
    final userRefFavorite = FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .collection('favorite');
    for (var item in favoriteItems) {
      await userRefFavorite.add({'product': item.toJson()});
    }
    await getUserFavoriteFromFirebase(user?.uid);
  }

  Future<void> getUserFavoriteFromFirebase(String? userUid) async {
    CollectionReference userFavoriteRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userUid)
        .collection('favorite');
    QuerySnapshot favoriteSnapshot = await userFavoriteRef.get();

    List<Product> favoriteFirebaseItems = favoriteSnapshot.docs.map((doc) {
      return Product.fromJson(doc['product']);
    }).toList();
    favoriteItems = favoriteFirebaseItems;
  }

  Future<void> clearUserFavorite(String? userUid) async {
    CollectionReference userFavoriteRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userUid)
        .collection('favorite');
    WriteBatch batch = FirebaseFirestore.instance.batch();
    QuerySnapshot favoriteSnapshot = await userFavoriteRef.get();
    for (QueryDocumentSnapshot doc in favoriteSnapshot.docs) {
      print('____________CLEAR_ ${doc.reference}');
      batch.delete(doc.reference);
    }
    await batch.commit();
  }
}
