import 'dart:convert';
import 'dart:math';

import 'package:food_app/constants/urls.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class GetProductsApi {
  List<ProductModel> items = [];

  Future<List<ProductModel>> getProducts() async {
    String url = mainUrl + "foods/";
    final result = await http.Client().get(Uri.parse(url));
    if (result.statusCode != 200) {
      return [];
    } else {
      // Iterable jsonModels = jsonDecode(result.body);
      // List<ProductModel> productsData = [];
      var jsonModels = jsonDecode(utf8.decode(result.bodyBytes));
      List<ProductModel> productsData = [];
      for (var i in jsonModels) {
        ProductModel product = ProductModel.fromJson(i);
        productsData.add(product);
      }
      items = productsData;
      return productsData;
    }
  }

  List<ProductModel> getOffers() {
    List<ProductModel> products = [];
    for (var i = 0; i < 5; i++) {
      Random random = Random();
      int randomNumber = random.nextInt(items.length);
      products.add(items[randomNumber]);
    }
    return products;
  }

  List<String> getCategories() {
    List<String> categories = [];
    for (var e in items) {
      var str = e.restaurant_category.split(',');
      for (var element in str) {
        if (!categories.contains(element)) {
          categories.add(element);
        }
      }
    }
    return categories;
  }

  List<ProductModel> getPopularItems() {
    List<ProductModel> products = [];
    for (var i = 0; i < 10; i++) {
      Random random = Random();
      int randomNumber = random.nextInt(items.length);
      products.add(items[randomNumber]);
    }
    return products;
  }

  List<ProductModel> getNearbyDeals() {
    List<ProductModel> products = [];
    for (var i = 0; i < 10; i++) {
      Random random = Random();
      int randomNumber = random.nextInt(items.length);
      products.add(items[randomNumber]);
    }
    return products;
  }

  List<Restaurant> getRestaurants() {
    List<Restaurant> result = [];
    for (var element in items) {
      final Product product = Product(
          id: element.id,
          name: element.name,
          category_name: element.category_name,
          price: element.price,
          photo: element.photo,
          count: 0);

      final item = result.firstWhere(
          (e) => e.restaurant_name == element.restaurant_name,
          orElse: () => Restaurant(
              restaurant_name: 'none',
              restaurant_category: '',
              restaurant_delivery: '',
              restaurant_delivery_price: 0,
              restaurant_logo: '',
              foods: []));

      if (item.restaurant_name == 'none') {
        final restaurant = Restaurant(
            restaurant_name: element.restaurant_name,
            restaurant_category: element.restaurant_category,
            restaurant_delivery: element.restaurant_delivery,
            restaurant_delivery_price: element.restaurant_delivery_price,
            restaurant_logo: element.restaurant_logo,
            foods: [product]);
        result.add(restaurant);
      } else {
        item.foods.add(product);
      }
    }

    // final jsonConvert = restaurants.map((e) => jsonEncode(e)).toList();

    // final uniqJsonList = jsonConvert.toSet().toList();

    // final result = uniqJsonList.map((e) => jsonDecode(e)).toList();
    return result;
  }
}
