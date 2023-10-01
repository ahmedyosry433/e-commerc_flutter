import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/model/allProductModel.dart';
import 'package:flutter_welcome_login_singup_screens/provider/cartProvider.dart';
import 'package:flutter_welcome_login_singup_screens/screens/productDetalis.dart';
import 'package:provider/provider.dart';

import '../../core/global/theme/app_colors/app_color_light.dart';

class ProductCard extends StatelessWidget {
  final AllProduct product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    String subtitle = product.title.substring(0, 12);
    return Card(
      margin: const EdgeInsets.all(2.0),
      child: Container(
        color: AppColorLight.cardColor,
        child: Stack(
          children: [
            // Product Image
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => productDetails(
                              product: product,
                            )));
              },
              child: Container(
                alignment: Alignment.center,
                child: Image.network(
                  product.image,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            // Overlay for Price, Rate, and Name
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                height: 40,
                color: Colors.black.withOpacity(0.6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.favorite_outline,
                      color: Colors.red,
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addToCart(product);
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}