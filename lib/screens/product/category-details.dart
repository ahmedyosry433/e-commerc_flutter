// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../core/global/theme/app_colors/app_color_light.dart';
import '../../model/product-model.dart';
import '../../provider/product-provider.dart';
import '../../widgets/product-card/product-card.dart';

class CategoryDetails extends StatelessWidget {
  List<Product> productlist;
  int index;
  CategoryDetails({Key? key, required this.productlist, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List categoriesList = Provider.of<ProductListProvider>(context).getcategory;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                '${categoriesList[index]}',
              ),
              centerTitle: true,
              elevation: 0,
            ),
            body: productlist.isNotEmpty
                ? Column(children: [
                    Expanded(
                      child: GridView.builder(
                        itemCount: productlist.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, index) =>
                            ProductCard(product: productlist[index]),
                      ),
                    )
                  ])
                : Center(
                    child: LoadingAnimationWidget.discreteCircle(
                      thirdRingColor: AppColorLight.secondColor,
                      secondRingColor: AppColorLight.iconColor,
                      color: AppColorLight.primaryColor,
                      size: 100,
                    ),
                  )));
  }
}
