// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/constants/constants.dart';
import 'package:flutter_welcome_login_singup_screens/widgets/product-card/cart-card.dart';
import 'package:provider/provider.dart';

import '../../core/global/theme/app_colors/app_color_light.dart';
import '../../provider/cart-provider.dart';

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
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(4, 10, 4, 10),
              height: 100,
              child: Expanded(
                child: Card(
                  color: AppColorLight.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Expanded(
                              child: Text(
                                "${double.parse((Provider.of<CartProvider>(context).totalCartPrice).toStringAsFixed(2))}",
                                style: const TextStyle(
                                    backgroundColor: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount:
                      Provider.of<CartProvider>(context).cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem =
                        Provider.of<CartProvider>(context).cartItems[index];

                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(4, 0, 4, 10),
                          height: 100,
                          child: Expanded(child: CartCard(cartItem: cartItem)),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
