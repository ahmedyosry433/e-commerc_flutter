// ignore_for_file: unnecessary_import, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnlineImage extends StatelessWidget {
  const OnlineImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                ),
                shape: BoxShape.circle,
                image: const DecorationImage(
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1458071103673-6a6e4c4a3413?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                    ),
                    fit: BoxFit.cover)),
          ),
          Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
          )
        ],
      ),
    );
  }
}
