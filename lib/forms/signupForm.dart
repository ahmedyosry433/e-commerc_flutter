// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/global/theme/app_colors/app_color_light.dart';
import '../provider/loginProvider.dart';
import '../provider/signupProvider.dart';

// ignore: must_be_immutable
class SignupForm extends StatelessWidget {
  SignupForm({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final providerSub = Provider.of<LoginProvider>(context);
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColorLight.textBoxColor),
            width: 266,
            child: TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                icon: Icon(
                  Icons.person,
                ),
                hintText: "Your Email",
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: 266,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: AppColorLight.textBoxColor,
                borderRadius: BorderRadius.circular(66)),
            child: TextFormField(
              controller: _passwordController,
              obscureText: providerSub.visibility,
              decoration: InputDecoration(
                  suffixIcon: TextButton(
                      onPressed: () {
                        providerSub.visibilityPassword();
                      },
                      child: Icon(providerSub.visibility
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  icon: const Icon(
                    Icons.lock,
                  ),
                  hintText: "Password",
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: 266,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: AppColorLight.textBoxColor,
                borderRadius: BorderRadius.circular(66)),
            child: TextField(
              controller: _confirmpasswordController,
              obscureText: providerSub.visibility,
              decoration: InputDecoration(
                  suffixIcon: TextButton(
                      onPressed: () {
                        providerSub.visibilityPassword();
                      },
                      child: Icon(providerSub.visibility
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  icon: const Icon(
                    Icons.lock,
                  ),
                  hintText: "Confirm Password",
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              try {
                Provider.of<SignupProvider>(context, listen: false).signUp(
                    emailController: _emailController,
                    passwordController: _passwordController);
              } catch (e) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('$e')));
              }
            },
            child: const Text(
              "SIGNUP",
            ),
          ),
        ],
      ),
    );
  }
}
