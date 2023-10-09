// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/model/product-model.dart';
import 'package:like_button/like_button.dart';

class LikeButtonHeartIcon extends StatelessWidget {
  LikeButtonHeartIcon({Key? key, required this.product}) : super(key: key);
  Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const LikeButton(
        circleColor:
            CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
        bubblesColor: BubblesColor(
          dotPrimaryColor: Colors.pink,
          dotSecondaryColor: Colors.white,
        ),
      ),
    );
  }
}
