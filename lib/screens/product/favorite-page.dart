// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../../provider/favorite-provider.dart';
import '../../widgets/product-card/product-card.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});
  @override
  Widget build(BuildContext context) {
    final favoiteList = Provider.of<FavoriteProvider>(context).likesItem;
    bool showBadge = favoiteList.isNotEmpty;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              badges.Badge(
                badgeStyle: const badges.BadgeStyle(
                    badgeColor: AppColorLight.primaryColor),
                position: badges.BadgePosition.topEnd(top: 12, end: 4),
                showBadge: showBadge,
                badgeContent: Text(
                  '${favoiteList.length}',
                  style: const TextStyle(color: Colors.white),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.favorite_outline,
                    size: 38,
                  ),
                ),
              )
            ],
            elevation: 0,
            title: const Center(child: Text('Favorite')),
          ),
          body: favoiteList.isNotEmpty
              ? Column(
                  children: [
                    Expanded(
                      child: GridView.count(
                          childAspectRatio: 0.8,
                          crossAxisCount: 2,
                          children: List.generate(favoiteList.length, (index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    width: 185,
                                    child: ProductCard(
                                        product: favoiteList[index])),
                              ],
                            );
                          })),
                    ),
                  ],
                )
              : Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/Loving_it.png'),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'No Favorites yet',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                )),
    );
  }
}
