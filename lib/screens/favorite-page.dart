import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/like-provider.dart';
import '../widgets/product-card/productCard.dart';

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
                      Provider.of<LikeButtonProvider>(context).likesItem.length,
                  itemBuilder: (context, index) {
                    final likesItems = Provider.of<LikeButtonProvider>(context)
                        .likesItem[index];

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
