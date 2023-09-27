import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/model/allProductModel.dart';
import 'package:flutter_welcome_login_singup_screens/screens/product_detalis.dart';

import '../../core/global/theme/app_colors/app_color_light.dart';

class ProductCard extends StatelessWidget {
  final  AllProduct product;

  const ProductCard({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => productDetails(
                      product: this.product,
                    )));
      },
      child: Card(
        margin: const EdgeInsets.all(2.0),
        child: Container(
          color: AppColorLight.cardColor,
          child: Stack(
            children: [
              // Product Image
              Container(
                alignment: Alignment.center,
                child: Image.network(
                  this.product.image,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  width: 150,
                  height: 150,
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
                        this.product.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
