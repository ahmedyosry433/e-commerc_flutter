// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/provider/product-provider.dart';
import 'package:provider/provider.dart';

import '../../core/server/category-apis.dart';
import '../../model/product-model.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

 
  @override
  Widget build(BuildContext context) {
    List categoriesList = Provider.of<ProductListProvider>(context).getcategory;
    final productListProvider =
        Provider.of<ProductListProvider>(context, listen: false);
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
                      onPressed: () async {
                        List<Product> products =
                            await CategoryApis.getProductWithCategory(
                                categoriesList[index]);
                        productListProvider.setProducts(products);
                      },
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
