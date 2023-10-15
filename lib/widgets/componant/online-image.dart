// ignore_for_file: unnecessary_import, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/user-provider.dart';

class OnlineImage extends StatelessWidget {
  const OnlineImage({super.key});

  @override
  Widget build(BuildContext context) {
    final imagefrompicker = Provider.of<UserProvider>(context).imageProfile;
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 50,
            foregroundImage: imagefrompicker == null
                ? NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/9/9a/No_avatar.png')
                : null,
            backgroundImage:
                imagefrompicker != null ? FileImage(imagefrompicker) : null,
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
