import 'dart:convert';
import 'dart:math';

import 'package:food_app/constants/urls.dart';
import 'package:food_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class GetProductsApi {
  Future<List<ProductModel>?> getProducts() async {
    String url = mainUrl + "foods/";
    final result = await http.get(Uri.parse(url));
    if (result.statusCode != 200) {
      return [];
    } else {
      var jsonModels = jsonDecode(utf8.decode(result.bodyBytes));
      List<ProductModel> productsData = [];
      for (var i in jsonModels) {
        ProductModel product = ProductModel.fromJson(i);
        productsData.add(product);
      }
      return productsData;
    }
  }

  List<String> getCategories(List<ProductModel> allProducts) {
    List<String> categories = [];
    for (var e in allProducts) {
      var str = e.restaurant_category.split(',');
      for (var element in str) {
        if (!categories.contains(element)) {
          categories.add(element);
        }
      }
    }
    return categories;
  }

  List<ProductModel> getPopularItems(List<ProductModel> allProducts) {
    List<ProductModel> products = [];
    for (var i = 0; i < 10; i++) {
      Random random = Random();
      int randomNumber = random.nextInt(allProducts.length);
      products.add(allProducts[randomNumber]);
    }
    return products;
  }

  List getRestaurants(List<ProductModel> allProducts) {
    List<Map<String, dynamic>> restaurants = [];

    allProducts.forEach((element) {
      Map<String, String> item = {
        'logo': element.restaurant_logo,
        'name': element.restaurant_name,
      };
      restaurants.add(item);
    });

    final jsonConvert = restaurants.map((e) => jsonEncode(e)).toList();

    final uniqJsonList = jsonConvert.toSet().toList();

    final result = uniqJsonList.map((e) => jsonDecode(e)).toList();

    return result;
  }
}
