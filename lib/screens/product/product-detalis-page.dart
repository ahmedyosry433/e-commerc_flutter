// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';
import 'package:flutter_welcome_login_singup_screens/provider/cart-provider.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

import '../../provider/favorite-provider.dart';

// ignore: camel_case_types
class productDetails extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final product;
  const productDetails({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String subtitle = product.title.substring(0, 12);
    bool showBadge = Provider.of<CartProvider>(context).cartItems.isNotEmpty;
    final likeProvider = Provider.of<FavoriteProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
              backgroundColor: AppColorLight.appBarColor,
              onPressed: () {
                try {
                  Provider.of<CartProvider>(context, listen: false)
                      .addToCart(newProduct: product);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Product added successfully"),
                  ));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Added Faild "),
                  ));
                  print('_____________$e');
                }
              },
              child: const Icon(Icons.add_shopping_cart)),
          appBar: AppBar(
            actions: [
              badges.Badge(
                showBadge: showBadge,
                position: badges.BadgePosition.topEnd(top: 5, end: 7),
                badgeContent: Text(
                  '${Provider.of<CartProvider>(context).cartItems.length}',
                  style: const TextStyle(color: Colors.white),
                ),
                child: IconButton(
                    onPressed: () => Navigator.pushNamed(context, '/cart'),
                    icon: const Icon(Icons.shopping_cart_outlined),
                    iconSize: 35),
              ),
            ],
            title: Text(subtitle),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColorLight.cardColor),
                    width: double.infinity,
                    child: Image.network(
                      product.image,
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          subtitle,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: IconButton(
                          onPressed: () {
                            if (likeProvider.isLiked(product.id)) {
                              likeProvider.removeLike(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Favorite Removed')));
                              print(
                                  "_________________remove_________________${likeProvider.likesItem}");
                            } else {
                              likeProvider.addLike(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Favorite Added')));
                              print(
                                  "_______________add___________________${likeProvider.likesItem}");
                            }
                          },
                          icon: Icon(
                            Icons.favorite_sharp,
                            size: 50,
                            color: likeProvider.isLiked(product.id)
                                ? Colors.red
                                : AppColorLight.secondColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 0.4,
                    color: AppColorLight.dividerAndBorderColor,
                    indent: 8,
                    endIndent: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Unit Price : ${product.price}\$",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const Divider(
                    thickness: 0.4,
                    color: AppColorLight.dividerAndBorderColor,
                    indent: 8,
                    endIndent: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Unit",
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          "GM",
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.4,
                    color: AppColorLight.dividerAndBorderColor,
                    indent: 8,
                    endIndent: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Product Specification",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const Divider(
                    thickness: 0.4,
                    color: AppColorLight.dividerAndBorderColor,
                    indent: 8,
                    endIndent: 8,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
