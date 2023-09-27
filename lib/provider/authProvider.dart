// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();


  Future signIn() async {
    
  }

  TextEditingController getUserName() {
    return _userNameController;
  }

  TextEditingController getPassword() {
    return _passwordController;
  }

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
  }
}


