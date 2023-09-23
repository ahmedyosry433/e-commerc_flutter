// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/core/global/theme/app_colors/app_color_light.dart';
import 'package:flutter_welcome_login_singup_screens/model/allProductModel.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<AllProduct>> getData() async {
    String url = "https://fakestoreapi.com/products";

    var jsonData = await http.get(Uri.parse(url));

    if (jsonData.statusCode == 200) {
      List data = jsonDecode(jsonData.body);
      List<AllProduct> productList = [];

      for (var a in data) {
        AllProduct allProductObject = AllProduct.fromJson(a);
        productList.add(allProductObject);
      }
      return productList;
    } else {
      throw Exception("Error");
    }
  }

  late Future<List<AllProduct>> futureproduct;

  @override
  void initState() {
    super.initState();
    futureproduct = getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.white,
          title: const Center(child: Text('Green Shop')),
          leading: const Icon(Icons.menu),
          actions: const [Icon(Icons.shopping_cart), Icon(Icons.draw_outlined)],
        ),
        body: FutureBuilder<List<AllProduct>>(
          future: futureproduct,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  snapshot.data!.length,
                  (index) {
                    String subTitle =
                        snapshot.data![index].title.substring(1, 15);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 170,
                          height: 200,
                          child: Expanded(
                            child: Card(
                              margin: const EdgeInsets.all(2.0),
                              child: SizedBox(
                                width: 150,
                                height: 150,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/');
                                  },
                                  child: Container(
                                    color: AppColorLight.cardColor,
                                    child: Stack(
                                      children: [
                                        // Product Image
                                        Container(
                                          alignment: Alignment.center,
                                          child: Image.network(
                                            '${snapshot.data![index].image}',
                                            alignment: Alignment.center,
                                            fit: BoxFit.contain,
                                            width: 150,
                                            height: 150,
                                          ),
                                        ),
                                        // Overlay for Price, Rate, and Name
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            padding: const EdgeInsets.all(2),
                                            height: 40,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Icon(
                                                  Icons.favorite_outline,
                                                  color: Colors.red,
                                                ),
                                                Text(
                                                  subTitle,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                const Icon(
                                                  Icons.shopping_cart,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
