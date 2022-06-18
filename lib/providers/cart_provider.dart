import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_app/constants/urls.dart';
import 'package:food_app/models/order_model.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:http/http.dart' as http;

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cart = [];
  bool orderAlready = false;

  List<CartItem> get cart {
    return [..._cart];
  }

  void addItem(CartItem item) {
    _cart.add(item);
    notifyListeners();
  }

  void changeOrderAlready() {
    orderAlready = true;
    notifyListeners();
  }

  Future<bool> sendOrder(int userId, String phone_number, token) async {
    var url = mainUrl + 'orders/create/';
    bool sended = true;
    try {
      Order order = Order(userId, [], false, phone_number);

      cart.forEach((element) {
        element.foodList.forEach((e) {
          CartSend cartSend = CartSend(e.id, e.count, e.price);
          order.cart.add(cartSend);
        });
      });

      print(order.toMap());

      final responce = await http.post(Uri.parse(url),
          body: json.encode(order.toMap()),
          headers: {"Content-Type": "application/json", 'token': token});

      sended = true;
    } catch (e) {
      sended = false;
      print(e);
    }

    return sended;
  }

  void addItemFromOneItem(int foodId, CartItem res, int count) {
    final item = cart.firstWhere(
        (element) => element.restaurant_name == res.restaurant_name,
        orElse: (() => CartItem(
            id: 0,
            foodList: [],
            restaurant_name: "",
            restaurant_logo: "",
            restaurant_category: "",
            restaurant_delivery_price: 0,
            total: 0)));

    if (item.id == 0) {
      _cart.add(res);
      notifyListeners();
    } else {
      final res_item =
          item.foodList.firstWhere((element) => element.id == foodId);
      res_item.count = count;
      item.total = res.total;
      notifyListeners();
    }
  }

  // ignore: non_constant_identifier_names
  Map<String, dynamic> getCountOfFoodsInCartItem(String restaurant_name) {
    final item = cart.firstWhere(
      (element) => element.restaurant_name == restaurant_name,
      orElse: () => CartItem(
          id: 0,
          foodList: [],
          restaurant_name: "",
          restaurant_logo: "",
          restaurant_category: "",
          restaurant_delivery_price: 0,
          total: 0),
    );

    return {'list': item.foodList, 'total': item.total};
  }

  void deleteFoodFromCartItem(int foodId, int cartItemId) {
    final item = cart.firstWhere((element) => element.id == cartItemId);
    item.foodList.removeWhere((element) => element.id == foodId);
    item.total = item.foodList.fold(0,
        (prev, element) => prev + (int.parse(element.price) * element.count));

    if (item.foodList.isEmpty) {
      _cart.removeWhere((element) => element.id == cartItemId);
    }

    notifyListeners();
  }

  void deleteCartItem(int cartItemId) {
    final item = cart.firstWhere((element) => element.id == cartItemId);
    item.foodList.clear();
    _cart.removeWhere((element) => element.id == cartItemId);
    notifyListeners();
  }

  void clearAll() {
    orderAlready = false;
    _cart.clear();
    notifyListeners();
  }
}
