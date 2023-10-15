// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';
import 'package:flutter_welcome_login_singup_screens/core/server/category-apis.dart';
import 'package:flutter_welcome_login_singup_screens/model/product-model.dart';
import 'package:provider/provider.dart';

import '../../provider/product-provider.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final productListProvider =
        Provider.of<ProductListProvider>(context, listen: false);
    final categoriesList =
        Provider.of<ProductListProvider>(context).getcategory;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  setState(() {
                    selectedIndex = index;
                  });
                  List<Product> products =
                      await CategoryApis.getProductWithCategory(
                          categoriesList[index]);
                  productListProvider.setProducts(products);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        categoriesList[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedIndex == index
                              ? AppColorLight.primaryColor
                              : AppColorLight.appBarColor,
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 20 / 4), //top padding 5
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
}
