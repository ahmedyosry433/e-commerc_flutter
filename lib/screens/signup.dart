import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } catch (e) {
      print("Error signing up: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          "SIGNUP",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 10),
                        SvgPicture.asset(
                          "assets/icons/signup.svg",
                          width: 170,
                        ),
                        const SizedBox(height: 25),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(66),
                              color: AppColorLight.textBoxColor),
                          width: 266,
                          child: TextField(
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
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                suffix: Icon(Icons.visibility),
                                icon: Icon(
                                  Icons.lock,
                                  color: AppColorLight.iconColor,
                                ),
                                hintText: "Password",
                                border: InputBorder.none),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            signUp();
                            Navigator.pushReplacementNamed(context, '/auth');
                          },
                          child: const Text(
                            "SIGNUP",
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already Have An Accout?"),
                            TextButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, "/login"),
                                child: const Text("Sign in"))
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          width: 300,
                          child: const Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 0.6,
                                  color: AppColorLight.dividerAndBorderColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text("OR"),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 0.6,
                                  color: AppColorLight.dividerAndBorderColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color:
                                            AppColorLight.dividerAndBorderColor,
                                        width: 0.5)),
                                child: SvgPicture.asset(
                                  "assets/icons/facebook.svg",
                                  width: 27,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color:
                                            AppColorLight.dividerAndBorderColor,
                                        width: 0.5)),
                                child: SvgPicture.asset(
                                  "assets/icons/google-plus.svg",
                                  width: 27,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color:
                                            AppColorLight.dividerAndBorderColor,
                                        width: 0.5)),
                                child: SvgPicture.asset(
                                  "assets/icons/twitter.svg",
                                  width: 27,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: Image.asset(
                    "assets/images/signup_top.png",
                    width: 100,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Image.asset(
                    "assets/images/main_bottom.png",
                    width: 70,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
