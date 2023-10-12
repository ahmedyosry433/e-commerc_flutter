// ignore_for_file: use_build_context_synchronously, must_be_immutable, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';
import 'package:flutter_welcome_login_singup_screens/widgets/componant/online-image.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../../provider/cart-provider.dart';
import '../../provider/favorite-provider.dart';
import '../../provider/login-provider.dart';
import '../../provider/user-provider.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    bool showBadgeCart =
        Provider.of<CartProvider>(context).cartItems.isNotEmpty;
    bool showBadgeLike =
        Provider.of<FavoriteProvider>(context).likesItem.isNotEmpty;
    final userData =
        Provider.of<UserProvider>(context, listen: true).userAlreadyexist;
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName:
                Text("${userData['firstName']} ${userData['lastName']}"),
            accountEmail: Text('${user!.email}'),
            currentAccountPicture: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/profile'),
                child: const OnlineImage()),
            decoration: const BoxDecoration(
              color: AppColorLight.appBarColor,
              image: DecorationImage(
                fit: BoxFit.fill,
                opacity: 0.7,
                image: NetworkImage(
                    'https://biteable.com/wp-content/uploads/2019/07/Facebook-Cover-Video-Guide.png'),
              ),
            ),
          ),
          ListTile(
            titleTextStyle: const TextStyle(fontSize: 20, color: Colors.black),
            leading: const Icon(Icons.person_2_outlined),
            title: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: const Text(
                'Profile',
              ),
            ),
          ),
          ListTile(
            titleTextStyle: const TextStyle(fontSize: 20, color: Colors.black),
            trailing: badges.Badge(
              badgeStyle: const badges.BadgeStyle(
                  padding: EdgeInsets.all(8),
                  badgeColor: AppColorLight.primaryColor),
              showBadge: showBadgeLike,
              badgeContent: Text(
                '${Provider.of<FavoriteProvider>(context).likesItem.length}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            leading: const Icon(Icons.favorite_border_sharp),
            title: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/favorite');
              },
              child: const Text(
                "Favorite",
              ),
            ),
          ),
          ListTile(
            trailing: badges.Badge(
              badgeStyle: const badges.BadgeStyle(
                  padding: EdgeInsets.all(8),
                  badgeColor: AppColorLight.primaryColor),
              showBadge: showBadgeCart,
              badgeContent: Text(
                '${Provider.of<CartProvider>(context).cartItems.length}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            leading: const Icon(Icons.shopping_cart_outlined),
            titleTextStyle: const TextStyle(fontSize: 20, color: Colors.black),
            title: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/cart');
              },
              child: const Text(
                "Cart",
              ),
            ),
          ),
          ListTile(
            titleTextStyle: const TextStyle(fontSize: 20, color: Colors.black),
            leading: const Icon(Icons.category_outlined),
            title: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/categories');
              },
              child: const Text(
                'Categories',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout_sharp),
            titleTextStyle: const TextStyle(fontSize: 20, color: Colors.black),
            title: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Log Out',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    content: const Text('Do You Want To Logout ?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await Provider.of<LoginProvider>(context,
                                  listen: false)
                              .signOut();
                          Navigator.pop(context);
                        },
                        child: const Text("Yes"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text(
                'Logout',
                style: TextStyle(
                    color: AppColorLight.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
