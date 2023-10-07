import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../core/global/theme/app_colors/app_color_light.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool isValidEmail(String email) {
    // Define a regex pattern for a valid email
    final emailPattern = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailPattern.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 243, 241, 247),
                border: Border.all(color: AppColorLight.secondColor)),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter First Name';
                      } else if (!isAlpha(value)) {
                        return 'Only Letters Please';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "First Name",
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColorLight.primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColorLight.secondColor),
                        )),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Last Name';
                      } else if (!isAlpha(value)) {
                        return 'Only Letters Please';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Last Name",
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColorLight.primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColorLight.secondColor),
                        )),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextFormField(
                    readOnly: true,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Email';
                      } else if (!isValidEmail(value)) {
                        return 'Invalid email format';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Email",
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColorLight.primaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColorLight.primaryColor),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Phone';
                      } else if (isAlpha(value)) {
                        return 'Only Number Please';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Phone",
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColorLight.primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColorLight.secondColor),
                        )),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Address';
                      } else if (!isAlpha(value)) {
                        return 'Only Letter Please';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Address",
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColorLight.primaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColorLight.secondColor),
                        )),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Update",
            ),
          ),
        ],
      ),
    );
  }
}
