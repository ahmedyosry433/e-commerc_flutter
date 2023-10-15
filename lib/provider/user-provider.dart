// ignore_for_file: file_names, avoid_print, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class UserProvider with ChangeNotifier {
  dynamic userAlreadyexist;

  Future<void> addUserInfoToFirebase(
      {required User user,
      required String firstName,
      required String lastName,
      required File image,
      required String phone,
      required String address}) async {
    final userRef = FirebaseFirestore.instance.collection('users');

    await userRef.doc(user.uid).set({
      'firstName': firstName,
      'email': user.email,
      'lastName': lastName,
      'phone': phone,
      'image': image,
      'address': address,
    });
  }

  Future<Map<String, dynamic>?> getUserByUid({
    String? uid,
  }) async {
    try {
      DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (userSnapshot.exists) {
        userAlreadyexist = userSnapshot.data() as Map<String, dynamic>;
      } else {
        userAlreadyexist = {};
      }
    } catch (e) {
      userAlreadyexist = {};
    }
    notifyListeners();
    return {};
  }

  File? imageProfile;
  Future<void> pickImageProfile(ImageSource source) async {
    final pick = ImagePicker();
    final pickedFile = await pick.pickImage(source: source);
    if (pickedFile != null) {
      imageProfile = File(pickedFile.path);
      print('_______provider____picker');
      print('_______P____picker$imageProfile');

      notifyListeners();
    }
  }
}
