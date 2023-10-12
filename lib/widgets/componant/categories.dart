// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';
import 'package:flutter_welcome_login_singup_screens/core/server/category-apis.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Future<List> categoriesList = CategoryApis.getCategories();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: categoriesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                height: 25,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                snapshot.data![index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: selectedIndex == index
                                      ? AppColorLight.primaryColor
                                      : AppColorLight.appBarColor,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 20 / 4), //top padding 5
                                height: 2,
                                width: 30,
                                color: selectedIndex == index
                                    ? Colors.black
                                    : Colors.transparent,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            );
          }
          return Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: AppColorLight.blackColor,
              size: 0,
            ),
          );
        });
  }
}
