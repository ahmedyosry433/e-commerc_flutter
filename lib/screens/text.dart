import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.fromLTRB(4, 10, 4, 10),
      height: 100,
      child: Expanded(
        child: Card(
          color: AppColorLight.cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: const Text(
                      "229.93",
                      style: TextStyle(
                          backgroundColor: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    ));
  }
}
