import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/services/getProductsAPI.dart';

class FoodsProvider extends ChangeNotifier {
  List<ProductModel> products = [];
  List<String> categories = [];
  List<ProductModel> popularFoods = [];
  List<Restaurant> restaurants = [];
  List<ProductModel> nearbyDeals = [];
  List<ProductModel> offers = [];

  Future<void> get_data_from_api() async {
    GetProductsApi instanceOfApi = GetProductsApi();
    products = await instanceOfApi.getProducts();
    categories = instanceOfApi.getCategories();
    popularFoods = instanceOfApi.getPopularItems();
    restaurants = instanceOfApi.getRestaurants();
    nearbyDeals = instanceOfApi.getNearbyDeals();
    offers = instanceOfApi.getOffers();

    notifyListeners();
  }

  void changeCountOfFood(
      String restaurantName, int foodId, String statusChange) {
    final item = restaurants
        .firstWhere((element) => element.restaurant_name == restaurantName)
        .foods
        .firstWhere((element) => element.id == foodId);
    if (statusChange == 'INC') {
      item.count = item.count + 1;
    } else {
      if (item.count > 0) {
        item.count = item.count - 1;
      }
    }

    notifyListeners();
  }

  void clearCountFood(String restairantName) {
    final item = restaurants
        .firstWhere((element) => element.restaurant_name == restairantName);
    item.foods.forEach((element) {
      element.count = 0;
    });
    notifyListeners();
  }

  void cleanCountFoodItem(int foodId, String resName) {
    final item =
        restaurants.firstWhere((element) => element.restaurant_name == resName);
    item.foods.firstWhere((element) => element.id == foodId).count = 0;
    notifyListeners();
  }
}
