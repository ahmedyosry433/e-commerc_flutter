// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/model/cart-item.dart';
import 'package:provider/provider.dart';

import '../../core/global/theme/app_colors/app_color_light.dart';
import '../../provider/cartProvider.dart';
import '../../screens/productDetalis.dart';

// ignore: must_be_immutable
class CartCard extends StatelessWidget {
  CartItem cartItem;
  CartCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    String subtitle = cartItem.title.substring(0, 10);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => productDetails(
                        product: cartItem.product,
                      )));
        },
        child: Card(
          color: AppColorLight.cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white),
                      child: Image.network(
                        cartItem.product.image,
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            subtitle,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 4),
                          Text(
                              "Total: ${double.parse((cartItem.totalPrice).toStringAsFixed(2))} "),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () =>
                              Provider.of<CartProvider>(context, listen: false)
                                  .removeCart(newProduct: cartItem.product),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () =>
                              Provider.of<CartProvider>(context, listen: false)
                                  .addToCart(newProduct: cartItem.product),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "${cartItem.quantity} ×",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
