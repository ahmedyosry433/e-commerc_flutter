// ignore_for_file: implementation_imports, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  bool visibility = true;

  Future signIn(
      {required TextEditingController userNameController,
      required TextEditingController passwordController}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userNameController.text.trim(),
        password: passwordController.text.trim());
    notifyListeners();
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  visibilityPassword() {
    visibility = !visibility;
    notifyListeners();
  }
}
