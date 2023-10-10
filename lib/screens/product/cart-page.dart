// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/constants/constants.dart';
import 'package:flutter_welcome_login_singup_screens/widgets/product-card/cart-card.dart';
import 'package:provider/provider.dart';

import '../../provider/cart-provider.dart';

class ToCart extends StatelessWidget {
  const ToCart({super.key});
  @override
  Widget build(BuildContext context) {
    final providercart = Provider.of<CartProvider>(context);
    final productCartList = providercart.cartItems;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: const Center(
                  child: Text(
                Constants.to_cart,
              )),
            ),
            body: productCartList.isNotEmpty
                ? Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(4, 10, 4, 10),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              spreadRadius: 0,
                              blurRadius: 10,
                              color: Colors.grey.withOpacity(0.2),
                              offset: const Offset(10, 10),
                            ),
                          ]),
                          height: 100,
                          child: Expanded(
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 40,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                              itemCount: Provider.of<CartProvider>(context)
                                  .cartItems
                                  .length,
                              itemBuilder: (context, index) {
                                final cartItem =
                                    Provider.of<CartProvider>(context)
                                        .cartItems[index];

                                return Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          4, 0, 4, 10),
                                      height: 100,
                                      child: Expanded(
                                          child: CartCard(cartItem: cartItem)),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                : Container(
                    color: Colors.white,
                    child: Stack(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/empty_cart.png'),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Empty Cart ',
                            style: TextStyle(fontSize: 24),
                          )
                        ],
                      ),
                      Expanded(
                        child: Positioned(
                            right: 50,
                            top: 50,
                            child: Container(
                              width: 70,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                  color: const Color.fromARGB(255, 109, 69, 255)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    " Total",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  Text(
                                    '${double.parse((providercart.totalCartPrice).toStringAsFixed(2))}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            )),
                      )
                    ]),
                  )));
  }
}
