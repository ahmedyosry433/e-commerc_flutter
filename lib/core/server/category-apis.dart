
// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter_welcome_login_singup_screens/core/server/product-apis.dart';
import 'package:http/http.dart' as http;

import '../../model/product-model.dart';
import '../global/constants/constants.dart';

class CategoryApis {
  static Future<List> getCategories() async {
    String categoryUrl = 'https://fakestoreapi.com/products/categories';
    var jsonData = await http.get(Uri.parse(categoryUrl));
    if (jsonData.statusCode == 200) {
      List categoryData = jsonDecode(jsonData.body);
      categoryData.insert(0, "All");
      return categoryData;
    } else {
      throw Exception('_____Error From Fetch Categories');
    }
  }

  static Future<List<Product>> getProductWithCategory(String category) async {
    String url = Constants.ApiUrl + Constants.category + category;

    var jsonData = await http.get(Uri.parse(url));

    if (jsonData.statusCode == 200) {
      if (category == "All") {
        return ProductApis.getData();
      } else {
        List data = jsonDecode(jsonData.body);
        List<Product> productCategoryList = [];

        for (var a in data) {
          Product allProductObject = Product.fromJson(a);
          productCategoryList.add(allProductObject);
        }
        return productCategoryList;
      }
    } else {
      throw Exception("Error");
    }
  }
}
