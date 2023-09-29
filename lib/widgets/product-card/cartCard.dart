import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/model/allProductModel.dart';

import '../../core/global/theme/app_colors/app_color_light.dart';
import '../../screens/productDetalis.dart';

// ignore: must_be_immutable
class CartCard extends StatelessWidget {
  AllProduct product;
  CartCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    String subtitle = product.title.substring(0, 10);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => productDetails(
                        product: product,
                      )));
        },
        child: Card(
          color: AppColorLight.cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white),
                      child: Text(
                        '${product.price}',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            subtitle,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 4),
                          const Text("Total: 525.0"),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  "2 ×",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
