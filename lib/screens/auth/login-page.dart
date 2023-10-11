// ignore_for_file: use_build_context_synchronously, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';
import 'package:provider/provider.dart';

import '../../provider/login-provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerSub = Provider.of<LoginProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "LOGIN",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 60),
                        SvgPicture.asset(
                          "assets/icons/login.svg",
                          width: 250,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          width: 266,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(66),
                              color: AppColorLight.textBoxColor),
                          child: TextField(
                            controller: _userNameController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                ),
                                hintText: "Your Email",
                                border: InputBorder.none),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          width: 266,
                          decoration: BoxDecoration(
                              color: AppColorLight.textBoxColor,
                              borderRadius: BorderRadius.circular(66)),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: providerSub.visibility,
                            decoration: InputDecoration(
                              icon: const Icon(
                                Icons.lock,
                              ),
                              suffixIcon: TextButton(
                                onPressed: () {
                                  providerSub.visibilityPassword();
                                },
                                child: Icon(providerSub.visibility
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              border: InputBorder.none,
                              hintText: "Password",
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              await Provider.of<LoginProvider>(context,
                                      listen: false)
                                  .signIn(
                                      userNameController: _userNameController,
                                      passwordController: _passwordController);
                              Navigator.popAndPushNamed(context, '/splash');
                            } catch (e) {
                              // Handle specific FirebaseAuthExceptions
                              if (e is FirebaseAuthException) {
                                //user Not Found
                                if (e.code == 'user-not-found') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('User not found')));
                                  //Wrong Password
                                } else if (e.code == 'wrong-password') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Wrong password')));
                                } else if (e.code == 'invalid-email') {
                                  // Invalid email format
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Invalid email format')));
                                } else {
                                  // Handle other FirebaseAuthExceptions or display a generic error
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Authentication error: ${e.code}')));
                                }
                              } else {
                                // Handle other exceptions (not related to Firebase Authentication)
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'An unexpected error occurred: $e')));
                              }
                            }
                          },
                          child: const Text(
                            "LOGIN",
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't Have Any Account ?"),
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pushNamed(context, "/signup"),
                                    child: const Text("Sign up")),
                              ],
                            ),
                            TextButton(
                                clipBehavior: Clip.none,
                                onPressed: () async {
                                  await providerSub.resetPassword(
                                      email: _userNameController.text);
                                },
                                child: const Text("Forgot Password?")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                child: Image.asset(
                  "assets/images/main_top.png",
                  width: 100,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/login_bottom.png",
                  width: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
