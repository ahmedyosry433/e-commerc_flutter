// ignore_for_file: no_leading_underscores_for_local_identifiers, file_names

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

  bool isValidEmail(String email) {
    // Define a regex pattern for a valid email
    final emailPattern = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailPattern.hasMatch(email);
  }

  Future<bool> doesEmailExist(String email) async {
    try {
      final methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return methods.isNotEmpty; // Email exists if methods list is not empty
    } catch (e) {
      return false; // Handle error as needed
    }
  }

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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Email';
                } else if (!isValidEmail(value)) {
                  return 'Invalid email format';
                }
                return null;
              },
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
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
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter Your Confirm Password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                } else if (value != _passwordController.text) {
                  return 'Password Not Matching';
                }

                return null;
              },
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
              if (formKey.currentState!.validate()) {
                // try {
                Provider.of<SignupProvider>(context, listen: false).signUp(
                    emailController: _emailController,
                    passwordController: _passwordController);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Registration Is Success'),
                  ),
                );
                Navigator.popAndPushNamed(context, '/auth');
                /* } on FirebaseAuthException catch (e) {
                  
                    print('____F________________$e');
                  if (e.code == 'email-already-in-use') {
                    print('____________________$e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Has Email Already Been Registred'),
                      ),
                    );
                  }
                }*/
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
