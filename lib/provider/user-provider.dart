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

  Future<void> getUserByUid({
    String? uid,
  }) async {
    try {
      print('----------> MM ------');
      print('----------> MM ------');
      print('----------> MM ------');
      DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (userSnapshot.exists) {
        print('----------> ------');
        print('----------> ------');
        print('----------> ------');
        print(userSnapshot.data() as Map<String, dynamic>);
      } else {
        // User data not found
        return null;
      }
    } catch (e) {
       print('---------->ERROR ------');
      print('---------->ERROR ------');
      print('---------->ERROR ------');
      // Handle database errors
      print('Error fetching user data: $e');
      return null;
    }
  }
}
