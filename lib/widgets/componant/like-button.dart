// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/model/allProductModel.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

import '../../provider/like-provider.dart';

class LikeButtonHeartIcon extends StatelessWidget {
  LikeButtonHeartIcon({Key? key, required this.product}) : super(key: key);
  Product product;
  @override
  Widget build(BuildContext context) {
    final isLike = Provider.of<LikeButtonProvider>(context).isLike;
    return GestureDetector(
      onTap: () {
        if (isLike) {
          Provider.of<LikeButtonProvider>(context, listen: false)
              .removeLike(product);
          print('____________________From if Remove');
        } else {
          Provider.of<LikeButtonProvider>(context, listen: false)
              .addLike( product);
          print('_________________From Else Remove');
        }
      },
      child: LikeButton(
        circleColor:
            const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
        bubblesColor: const BubblesColor(
          dotPrimaryColor: Colors.pink,
          dotSecondaryColor: Colors.white,
        ),
        isLiked: isLike,
      ),
    );
  }
}
