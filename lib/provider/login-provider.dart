// ignore_for_file: implementation_imports, file_names, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

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

  Future<void> resetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('______________Error sending password reset email: $e');
    }
  }

  final localAuth = LocalAuthentication();

  Future<bool> canAuthenticate() async =>
      await localAuth.canCheckBiometrics || await localAuth.isDeviceSupported();

  Future<bool> biometricAuthentication() async {
    try {
      if (!await canAuthenticate()) return false;
      return await localAuth.authenticate(
          localizedReason: 'use face id to authenticate',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ));
    } catch (e) {
      print('____________From Biometric__________$e ');
      return false;
    }
  }
}
