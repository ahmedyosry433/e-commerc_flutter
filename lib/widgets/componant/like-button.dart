import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeButtonHeartIcon extends StatelessWidget {
  const LikeButtonHeartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      circleColor:
          const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Colors.pink,
        dotSecondaryColor: Colors.white,
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.favorite_outline,
          color: isLiked ? Colors.red : Colors.grey,
        );
      },
    );
  }
}
