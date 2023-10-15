// ignore_for_file: must_be_immutable, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/forms/profile-form.dart';
import 'package:flutter_welcome_login_singup_screens/provider/user-provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  GlobalKey<FormState> formKey = GlobalKey();

  File? selectImage;

  @override
  Widget build(BuildContext context) {
    final imagefrompicker = Provider.of<UserProvider>(context).imageProfile;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Edit Profile',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                Stack(children: [
                  CircleAvatar(
                    radius: 50,
                    foregroundImage: imagefrompicker == null
                        ? NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/9/9a/No_avatar.png')
                        : null,
                    backgroundImage: imagefrompicker != null
                        ? FileImage(imagefrompicker)
                        : null,
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () async {
                          await Provider.of<UserProvider>(context,
                                  listen: false)
                              .pickImageProfile(ImageSource.gallery);
                        },
                        child: const Icon(Icons.add_a_photo),
                      ))
                ]),
                const ProfileForm(),
              ],
            ),
            Positioned(
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back)),
            ),
          ],
        ),
      ),
    ));
  }
}
