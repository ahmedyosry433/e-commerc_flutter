// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favorite-provider.dart';
import '../../widgets/product-card/product-card.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Favorite')),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount:
                      Provider.of<FavoriteProvider>(context).likesItem.length,
                  itemBuilder: (context, index) {
                    final likesItems =
                        Provider.of<FavoriteProvider>(context).likesItem[index];

                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(4, 0, 4, 10),
                          height: 100,
                          child:
                              Expanded(child: ProductCard(product: likesItems)),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
