import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  Future<void> signUp({
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    notifyListeners();
  }

  
}
