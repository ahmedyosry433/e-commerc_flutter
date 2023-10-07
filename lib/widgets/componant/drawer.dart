// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';
import 'package:flutter_welcome_login_singup_screens/widgets/componant/online-image.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../../provider/cartProvider.dart';
import '../../provider/loginProvider.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    bool showBadge = Provider.of<CartProvider>(context).cartItems.isNotEmpty;
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("${user!.displayName}"),
            accountEmail: Text('${user!.email}'),
            currentAccountPicture: const OnlineImage(),
            decoration: const BoxDecoration(
              color: AppColorLight.appBarColor,
              image: DecorationImage(
                fit: BoxFit.fill,
                opacity: 0.7,
                image: NetworkImage(
                    'https://st2.depositphotos.com/2124221/46122/i/1600/depositphotos_461226038-stock-photo-abstract-geometric-background-poly-pattern.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_2_outlined),
            title: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: const Text('Profile'),
            ),
          ),
          ListTile(
            trailing: badges.Badge(
              badgeStyle: const badges.BadgeStyle(padding: EdgeInsets.all(8)),
              showBadge: showBadge,
              badgeContent: Text(
                  '${Provider.of<CartProvider>(context).cartItems.length}'),
            ),
            leading: const Icon(Icons.shopping_cart),
            title: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/cart');
              },
              child: const Text("Cart"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout_sharp),
            title: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Log Out'),
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
              child: const Text('Logout'),
            ),
          )
        ],
      ),
    );
  }
}
