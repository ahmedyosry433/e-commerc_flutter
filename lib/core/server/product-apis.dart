// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/product-model.dart';
import '../global/constants/constants.dart';

class ProductApis {
  static Future<List<Product>> getData() async {
    String url = Constants.ApiUrl;

    var jsonData = await http.get(Uri.parse(url));

    if (jsonData.statusCode == 200) {
      List data = jsonDecode(jsonData.body);
      List<Product> productList = [];

      for (var a in data) {
        Product allProductObject = Product.fromJson(a);
        productList.add(allProductObject);
      }
      return productList;
    } else {
      throw Exception("Error");
    }
  }

  static Future<List<Product>> getProductWithCategory(String category) async {
    String url = Constants.ApiUrl + Constants.category + category;
    print(1);
    var jsonData = await http.get(Uri.parse(url));
    print(2);
    if (jsonData.statusCode == 200) {
      List data = jsonDecode(jsonData.body);
      List<Product> productList = [];
    print(3);
      for (var a in data) {
        Product allProductObject = Product.fromJson(a);
        productList.add(allProductObject);
      }
      return productList;
    } else {
      throw Exception("Error");
    }
  }
}
