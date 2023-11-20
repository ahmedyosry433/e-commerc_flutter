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
  

  
}
