// ignore_for_file: avoid_print, use_build_context_synchronously, file_names, unnecessary_null_comparison, prefer_if_null_operators

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/provider/user-provider.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

import '../core/global/theme/app_colors/app_color_light.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final imagefrompicker = Provider.of<UserProvider>(context).imageProfile;
    final userData =
        Provider.of<UserProvider>(context, listen: false).userAlreadyexist;
    return Form(
      key: formKey,
      child: Column(children: [
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: AppColorLight.shadowColor,
                  blurRadius: 10,
                  offset: Offset(3, 3))
            ],
            borderRadius: BorderRadius.circular(15),
            color: AppColorLight.whiteColor,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: TextFormField(
                  controller: _firstNameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter First Name';
                    } else if (!isAlpha(value)) {
                      return 'Only Letters Please';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "${userData['firstName']}" == null
                        ? "First Name"
                        : "${userData['firstName']}",
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColorLight.primaryColor, width: 0.5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColorLight.secondColor),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColorLight.primaryColor, width: 0.5),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextFormField(
                  controller: _lastNameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Last Name';
                    } else if (!isAlpha(value)) {
                      return 'Only Letters Please';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "${userData['lastName']}" != null
                          ? "${userData['lastName']}"
                          : "last Name",
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColorLight.primaryColor, width: 0.5),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColorLight.primaryColor, width: 0.5),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColorLight.secondColor),
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "${user!.email}",
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColorLight.primaryColor, width: 0.5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColorLight.primaryColor, width: 0.5),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColorLight.primaryColor, width: 0.5),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Phone';
                    } else if (isAlpha(value)) {
                      return 'Only Number Please';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "${userData['phone']}" != null
                        ? "${userData['phone']}"
                        : "Phone",
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColorLight.primaryColor, width: 0.5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColorLight.secondColor),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColorLight.primaryColor, width: 0.5),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: TextFormField(
                  controller: _addressController,
                  keyboardType: TextInputType.streetAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Address';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "${userData['address']}" != null
                          ? "${userData['address']}"
                          : "Address",
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColorLight.primaryColor, width: 0.5),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColorLight.primaryColor, width: 0.5),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColorLight.secondColor),
                      )),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ElevatedButton(
            onPressed: () async {
              try {
                if (formKey.currentState!.validate()) {
                  await Provider.of<UserProvider>(context, listen: false)
                      .addUserInfoToFirebase(
                    user: user!,
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    phone: _phoneController.text,
                    address: _addressController.text,
                    image: imagefrompicker!,
                  );
                  Provider.of<UserProvider>(context, listen: false)
                      .getUserByUid(uid: user?.uid);
                  print(
                      'EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE____${Provider.of<UserProvider>(context, listen: false).getUserByUid(uid: user?.uid)}');
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Updated Done'),
                    ),
                  );
                }
                print('__________________________________DONE');
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Updated Faild'),
                  ),
                );
                print('__________________________________$e');
              }
            },
            child: const Text(
              "Update",
            ),
          ),
        ),
      ]),
    );
  }
}
