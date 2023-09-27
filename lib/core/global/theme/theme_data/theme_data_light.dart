import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';

ThemeData getThemeDataLight() => ThemeData(
    appBarTheme: const AppBarTheme(color: AppColorLight.appBarColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColorLight.primaryColor),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 110, vertical: 17)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27),
        )),
        foregroundColor:
            MaterialStateProperty.all(AppColorLight.backgroundLight),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 30,
          color: AppColorLight.titleTextLargeLight,
          fontFamily: "myfont"),
      titleMedium: TextStyle(
          color: Colors.black,
          fontFamily: "myfont",
          fontSize: 27,
          fontWeight: FontWeight.bold),
      titleSmall:
          TextStyle(color: Colors.black, fontFamily: "myfont", fontSize: 15),
    ),
    iconTheme: const IconThemeData(color: AppColorLight.iconColor));
