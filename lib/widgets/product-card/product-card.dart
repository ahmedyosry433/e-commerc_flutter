// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
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
                    borderRadius: BorderRadius.circular(30)),
                elevation: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        subtitle,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' '${product.price}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          IconButton(
                              onPressed: () {
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
                              icon: const Icon(
                                Icons.shopping_cart,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 40,
              top: 7,
              height: 120,
              width: 100,
              child: Image.network(product.image),
            ),
          ],
        ));
  }
}
