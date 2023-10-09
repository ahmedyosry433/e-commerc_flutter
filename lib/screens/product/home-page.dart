// ignore_for_file: file_names

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/constants/constants.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';
import 'package:flutter_welcome_login_singup_screens/model/product-model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../provider/cart-provider.dart';
import '../../provider/user-provider.dart';
import '../../widgets/componant/drawer.dart';
import '../../widgets/product-card/product-card.dart';
import 'package:badges/badges.dart' as badges;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Product>> getData() async {
    String url = Constants.ApiUrl;

    var jsonData = await http.get(Uri.parse(url));

    if (jsonData.statusCode == 200) {
      List data = jsonDecode(jsonData.body);
      List<Product> productList = [];

      for (var a in data) {
        Product allProductObject = Product.fromJson(a);
        productList.add(allProductObject);
      }
      return productList;
    } else {
      throw Exception("Error");
    }
  }

  getUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    await Provider.of<UserProvider>(context, listen: false)
        .getUserByUid(uid: user?.uid);
  }

  late Future<List<Product>> futureproduct;
  @override
  void initState() {
    super.initState();
    futureproduct = getData();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    bool showBadge = Provider.of<CartProvider>(context).cartItems.isNotEmpty;
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          elevation: 0,
          title: const Center(
              child: Text(
            Constants.ProjectName,
            style: TextStyle(color: Colors.black),
          )),
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
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                  iconSize: 35),
            ),
          ],
        ),
        body: FutureBuilder<List<Product>>(
          future: futureproduct,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                childAspectRatio: 0.8,
                crossAxisSpacing: 7,
                crossAxisCount: 2,
                children: List.generate(
                  snapshot.data!.length,
                  (index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 180,
                          height: 220,
                          child: ProductCard(product: snapshot.data![index]),
                        ),
                      ],
                    );
                  },
                ),
              );
            }
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: AppColorLight.primaryColor,
                size: 150,
              ),
            );
          },
        ),
      ),
    );
  }
}
