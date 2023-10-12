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
          body: SingleChildScrollView(
            child: Stack(children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 70, 20, 30),
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: AppColorLight.shadowColor,
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ],
                          borderRadius: BorderRadius.circular(25),
                          color: AppColorLight.whiteColor),
                      width: double.infinity,
                      child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Image.network(
                              product.image,
                              width: 200,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: likeProvider.isLiked(product.id)
                                        ? AppColorLight.whiteColor
                                        : AppColorLight.iconColor),
                                child: IconButton(
                                  onPressed: () {
                                    if (likeProvider.isLiked(product.id)) {
                                      likeProvider.removeLike(product);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text('Favorite Removed')));
                                    } else {
                                      likeProvider.addLike(product);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text('Favorite Added')));
                                    }
                                  },
                                  icon: Icon(
                                    Icons.favorite_sharp,
                                    size: 35,
                                    color: likeProvider.isLiked(product.id)
                                        ? Colors.red
                                        : AppColorLight.whiteColor,
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Text(
                            subtitle,
                            style: Theme.of(context).textTheme.bodyLarge,
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
                      padding: const EdgeInsets.fromLTRB(6, 15, 8, 15),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Unit Price",
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            " ${product.price}\$",
                            style: const TextStyle(
                                color: AppColorLight.primaryColor,
                                fontSize: 16),
                          )
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Unit",
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Text(
                            "GM",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: AppColorLight.primaryColor,
                                fontSize: 16),
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
              Positioned(
                  child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              )),
              Positioned(
                right: 0,
                child: badges.Badge(
                  showBadge: showBadge,
                  position: badges.BadgePosition.topEnd(top: 5, end: 7),
                  badgeStyle: const badges.BadgeStyle(
                      badgeColor: AppColorLight.primaryColor),
                  badgeContent: Text(
                    '${Provider.of<CartProvider>(context).cartItems.length}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                      onPressed: () => Navigator.pushNamed(context, '/cart'),
                      icon: const Icon(Icons.shopping_cart_outlined),
                      iconSize: 35),
                ),
              )
            ]),
          )),
    );
  }
}
