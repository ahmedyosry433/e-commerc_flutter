// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

import '../../core/server/category-apis.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});
  List categoriesList = CategoryApis.categoryList;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Categories",
          ),
        ),
        body: Stack(children: [
          ListView.builder(
              itemCount: categoriesList.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/Loving_it.png',
                      width: 120,
                      height: 120,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('${categoriesList[index]}',
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.arrow_forward))
                  ],
                );
              }),
        ]),
      ),
    );
  }
}
