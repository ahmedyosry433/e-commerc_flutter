import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/theme_data/theme_data_light.dart';
import 'package:flutter_welcome_login_singup_screens/screens/auth.dart';
import 'package:flutter_welcome_login_singup_screens/provider/authProvider.dart';
import 'package:flutter_welcome_login_singup_screens/screens/product_detalis.dart';
import 'package:flutter_welcome_login_singup_screens/screens/signup.dart';
import 'package:flutter_welcome_login_singup_screens/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'screens/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        theme: getThemeDataLight(),
        initialRoute: "/auth",
        routes: {
          "/auth": (context) => const Auth(),
          "/signup": (context) => const Signup(),
          "/login": (context) => const Login(),
          "/": (context) => const Welcome(),
        },
      ),
    );
  }
}
