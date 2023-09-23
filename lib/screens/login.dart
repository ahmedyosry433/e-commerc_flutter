import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _userNameController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                                hintText: "User Name",
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
                            obscureText: true,
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                ),
                                suffixIcon: Icon(Icons.visibility),
                                hintText: "Password",
                                border: InputBorder.none),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            signIn();
                          },
                          child: const Text(
                            "LOGIN",
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't Have Any Account ?"),
                            TextButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, "/signup"),
                                child: const Text("Sign up"))
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
