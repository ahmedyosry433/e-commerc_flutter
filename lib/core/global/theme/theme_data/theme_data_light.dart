import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';

ThemeData getThemeDataLight() => ThemeData(
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(AppColorLight.primaryColor),
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
        ),
        titleMedium: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(color: Colors.black, fontSize: 15),
        bodyLarge: TextStyle(
            color: Colors.black, fontSize: 27, fontWeight: FontWeight.bold),
      ),
    );
