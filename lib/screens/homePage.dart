// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_welcome_login_singup_screens/model/allProductModel.dart';
import 'package:http/http.dart' as http;
import '../widgets/product-card/product-card.dart';

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
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 170,
                          height: 200,
                          child: Expanded(
                              child:
                                  ProductCard(product: snapshot.data![index])),
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
