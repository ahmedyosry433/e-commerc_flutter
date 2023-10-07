import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider with ChangeNotifier {
  Future<void> addUserInfoToFirebase(
      {required User user,
      required String firstName,
      required String lastName,
      required String phone,
      required String address}) async {
    final userRef = FirebaseFirestore.instance.collection('users');

    await userRef.doc(user.uid).set({
      'firstName': firstName,
      'email': user.email,
      'lastName': lastName,
      'phone': phone,
      'address': address,
    });
  }
}
