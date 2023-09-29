import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/constants/constants.dart';
import 'package:flutter_welcome_login_singup_screens/widgets/product-card/cartCard.dart';
import 'package:provider/provider.dart';

import '../provider/cartProvider.dart';

class ToCart extends StatelessWidget {
  const ToCart({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            Constants.to_cart,
          )),
        ),
        body: ListView.builder(
            itemCount: Provider.of<CartProvider>(context).cartItems.length,
            itemBuilder: (context, index) {
              final productLoop =
                  Provider.of<CartProvider>(context).cartItems[index];

              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(4, 0, 4, 10),
                    height: 100,
                    child: Expanded(child: CartCard(product: productLoop)),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
