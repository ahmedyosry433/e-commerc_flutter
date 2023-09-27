import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';

// ignore: camel_case_types
class productDetails extends StatelessWidget {
  final product;
  const productDetails({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(product);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Product Details'),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColorLight.cardColor),
                  width: double.infinity,
                  child: Image.network(
                    'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-math-90946.jpg&fm=jpg',
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Product Name",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Product Name",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 110,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColorLight.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Quantity: 1",
                            style: Theme.of(context).textTheme.titleSmall,
                          )),
                      Text(
                        "\$50",
                        style: Theme.of(context).textTheme.titleMedium,
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
                  padding: EdgeInsets.fromLTRB(8, 15, 8, 15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Unit Price : 50\$",
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
                      Text(
                        "GM",
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.titleSmall,
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
                  padding: EdgeInsets.fromLTRB(8, 15, 8, 15),
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
          )),
    );
  }
}
