// ignore_for_file: file_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/constants/constants.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';
import 'package:flutter_welcome_login_singup_screens/core/server/category-apis.dart';
import 'package:flutter_welcome_login_singup_screens/core/server/product-apis.dart';
import 'package:flutter_welcome_login_singup_screens/model/product-model.dart';
import 'package:flutter_welcome_login_singup_screens/provider/favorite-provider.dart';
import 'package:flutter_welcome_login_singup_screens/widgets/componant/categories.dart';
import 'package:provider/provider.dart';
import '../../provider/cart-provider.dart';
import '../../provider/product-provider.dart';
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
  User? user = FirebaseAuth.instance.currentUser;
  getUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;
    await Provider.of<UserProvider>(context, listen: false)
        .getUserByUid(uid: user?.uid);
  }

  bool isLoad = false;
  getProduct() async {
    if (!isLoad) {
      List<Product> products = await ProductApis.getData();
      context.read<ProductListProvider>().setProducts(products);
      setState(() {
        isLoad = true;
      });
    }
    //start loading =true
    //end loding = false
  }

  getCategories() async {
    List category = await CategoryApis.getCategories();
    context.read<ProductListProvider>().setcategoies(category);
  }

  getCarts() async {
    context.read<CartProvider>().getUserCarts(user?.uid);
  }

  getFavorites() async {
    context.read<FavoriteProvider>().getUserFavoriteFromFirebase(user?.uid);
  }

  @override
  void initState() {
    getCategories();
    getProduct();
    getUserInfo();
    getCarts();
    getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool showBadge =
        Provider.of<CartProvider>(context, listen: true).cartItems.isNotEmpty;
    ProductListProvider productListProvider =
        Provider.of<ProductListProvider>(context);
    List<Product> productList = productListProvider.products;
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
              badgeStyle: const badges.BadgeStyle(
                  badgeColor: AppColorLight.primaryColor),
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
        body: productList.isNotEmpty || isLoad
            ? Column(children: [
                const Categories(),
                Expanded(
                  child: GridView.builder(
                    itemCount: productList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) =>
                        ProductCard(product: productList[index]),
                  ),
                )
              ])
            : Center(
                child: LoadingAnimationWidget.discreteCircle(
                  thirdRingColor: AppColorLight.secondColor,
                  secondRingColor: AppColorLight.iconColor,
                  color: AppColorLight.primaryColor,
                  size: 100,
                ),
              ),
      ),
    );
  }
}
