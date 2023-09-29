import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';
import 'package:flutter_welcome_login_singup_screens/provider/loginProvider.dart';
import 'package:flutter_welcome_login_singup_screens/provider/signupProvider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
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
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_confirmpasswordController ==
                                _passwordController) {
                              Provider.of<SignupProvider>(context,
                                      listen: false)
                                  .signUp(
                                emailController: _emailController,
                                passwordController: _passwordController,
                              );
                              Navigator.pop(context);
                            } else {
                              Navigator.pushNamed(context, '/signup');
                            }
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
                              onTap: () {
                                signInWithFacebook();
                                Navigator.pushNamed(context, 'auth');
                              },
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
                              onTap: () {
                                signInWithGoogle();
                                Navigator.pushNamed(context, 'auth');
                              },
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
    );
  }
}
