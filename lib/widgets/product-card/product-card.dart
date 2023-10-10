// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';
import 'package:flutter_welcome_login_singup_screens/model/product-model.dart';
import 'package:flutter_welcome_login_singup_screens/provider/cart-provider.dart';
import 'package:provider/provider.dart';

import '../../screens/product/product-detalis-page.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    String subtitle = product.title.substring(0, 12);
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => productDetails(
                        product: product,
                      )));
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 240,
              width: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 40,
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0,
                        offset: const Offset(10, 10)),
                  ]),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(subtitle,
                            style: Theme.of(context).textTheme.labelLarge),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' '${product.price}',
                            style: const TextStyle(
                                color: AppColorLight.primaryColor,
                                fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              try {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .addToCart(newProduct: product);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Product added successfully"),
                                ));
                              } catch (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Added Faild "),
                                ));
                                print('_____________$e');
                              }
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: const BoxDecoration(
                                color: AppColorLight.iconColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add_shopping_cart_sharp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // IconButton(
                          // onPressed: () {
                          //   try {
                          //     Provider.of<CartProvider>(context,
                          //             listen: false)
                          //         .addToCart(newProduct: product);
                          //     ScaffoldMessenger.of(context)
                          //         .showSnackBar(const SnackBar(
                          //       content: Text("Product added successfully"),
                          //     ));
                          //   } catch (e) {
                          //     ScaffoldMessenger.of(context)
                          //         .showSnackBar(const SnackBar(
                          //       content: Text("Added Faild "),
                          //     ));
                          //     print('_____________$e');
                          //   }
                          // },
                          //     icon: const Icon(
                          //       Icons.add_shopping_cart_sharp,
                          //     ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 40,
              top: 22,
              height: 120,
              width: 100,
              child: Image.network(product.image),
            ),
          ],
        ));
  }
}
