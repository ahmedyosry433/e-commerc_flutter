import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/theme_data/theme_data_light.dart';
import 'package:flutter_welcome_login_singup_screens/provider/user-provider.dart';
import 'package:flutter_welcome_login_singup_screens/provider/signup-provider.dart';
import 'package:flutter_welcome_login_singup_screens/screens/auth/profile-page.dart';
import 'package:flutter_welcome_login_singup_screens/screens/auth/signup-page.dart';
import 'package:flutter_welcome_login_singup_screens/screens/auth/welcome-page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'forms/validation.dart';
import 'provider/cart-provider.dart';
import 'provider/favorite-provider.dart';
import 'screens/product/cart-page.dart';
import 'provider/login-provider.dart';
import 'screens/product/category-page.dart';
import 'screens/product/favorite-page.dart';
import 'screens/auth/splash-page.dart';
import 'screens/auth/login-page.dart';
import 'screens/product/home-page.dart';

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
    return MultiProvider(
      providers: [
        ListenableProvider<UserProvider>(create: (context) => UserProvider()),
        ListenableProvider<CartProvider>(create: (context) => CartProvider()),
        ListenableProvider<LoginProvider>(create: (context) => LoginProvider()),
        ListenableProvider<SignupProvider>(
            create: (context) => SignupProvider()),
        ListenableProvider<Validation>(create: (context) => Validation()),
        ListenableProvider<FavoriteProvider>(
            create: (context) => FavoriteProvider()),
      ],
      child: MaterialApp(
        theme: getThemeDataLight(),
        initialRoute: "/splash",
        routes: {
          "/splash": (context) => const Splash(),
          "/signup": (context) => const Signup(),
          "/login": (context) => const Login(),
          "/": (context) => const Welcome(),
          "/cart": (context) => const ToCart(),
          "/profile": (context) => Profile(),
          "/favorite": (context) => const Favorite(),
          "/home": (context) => const HomePage(),
          "/categories": (context) => CategoryPage(),
        },
      ),
    );
  }
}
