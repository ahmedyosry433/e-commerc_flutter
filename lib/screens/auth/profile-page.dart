// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';
import 'package:flutter_welcome_login_singup_screens/forms/profile-form.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
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
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColorLight.primaryColor, width: 0.10),
                      boxShadow: [
                        BoxShadow(
                            color: AppColorLight.shadowColor.withOpacity(0.7),
                            blurRadius: 5)
                      ],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1458071103673-6a6e4c4a3413?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                          ),
                          fit: BoxFit.cover)),
                ),
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
