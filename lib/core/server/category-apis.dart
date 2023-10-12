// ignore_for_file: file_names, avoid_print, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoryApis {
  static late final categoryList;
  static final categoryData = getCategories();

  static Future<List> getCategories() async {
    String categoryUrl = 'https://fakestoreapi.com/products/categories';
    var jsonData = await http.get(Uri.parse(categoryUrl));
    if (jsonData.statusCode == 200) {
      List categoryData = jsonDecode(jsonData.body);
      print('_____________________$categoryData');
      categoryData.insert(0, "All");
      categoryList = categoryData;
      return categoryData;
    } else {
      throw Exception('_____Error From Fetch Categories');
    }
  }
}
