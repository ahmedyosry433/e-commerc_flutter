import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Validation with ChangeNotifier {
  bool isValidEmail(String email) {
    // Define a regex pattern for a valid email
    final emailPattern = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    notifyListeners();
    return emailPattern.hasMatch(email);
  }

  validationPasswordSignup(
      String? value, TextEditingController passwordController) {
    if (value == null || value.isEmpty) {
      return "Please Enter Password";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters";
    } else if (value != passwordController.text) {
      return 'Password Not Matching';
    }
    notifyListeners();
  }
    Future<bool> doesEmailExist(String email) async {
    try {
      final methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return methods.isNotEmpty; 
      // Email exists if methods list is not empty
    } catch (e) {
      return false; // Handle error as needed
    }
  }

}
