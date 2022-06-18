import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/urls.dart';
import 'package:food_app/models/order_model.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/models/user_model.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/providers/foods_provider.dart';
import 'package:food_app/routes/router.dart';
import 'package:food_app/services/database_helper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class AuthProvider extends ChangeNotifier {
  User? currentUser;
  bool isAuth = false;
  bool isLoad = false;

  void checkAuth() async {
    List<User> users = await DatabaseHelper().getUser();

    if (users.first.token != '') {
      isAuth = true;

      currentUser = User(
          id: users.first.id,
          name: users.first.name,
          email: users.first.email,
          password: users.first.password,
          phone_number: users.first.phone_number,
          cards: users.first.cards,
          token: users.first.token,
          orderList: users.first.orderList);

      notifyListeners();
    }
  }

  void changeUser(email, phone) {
    currentUser?.phone_number = phone;
    currentUser?.email = email;
    notifyListeners();
  }

  void login(String email, String password, BuildContext context) async {
    Database db = await DatabaseHelper().db;
    String url = mainUrl + 'login/';
    String urlOrders = mainUrl + 'myorders/';
    isLoad = true;
    notifyListeners();
    try {
      final responce = await http
          .post(Uri.parse(url), body: {"email": email, "password": password});
      String body = utf8.decode(responce.bodyBytes);

      final result = json.decode(body) as Map<String, dynamic>;

      if (result['message'] != null && result['jwt'] != null) {
        isAuth = true;
        isLoad = false;
        print(result['user']['id']);
        final responceMyOrders = await http.post(Uri.parse(urlOrders),
            body: {"id": result['user']['id'].toString()});

        String bodyMyOrders = utf8.decode(responceMyOrders.bodyBytes);
        final resultMyOrdes = json.decode(bodyMyOrders) as List<dynamic>;
        final List<OrderReceive> myOrders = [];
        resultMyOrdes.forEach((e) {
          print(e);
          final List<Map<String, dynamic>> listFoods = [];

          ProductModel food = context
              .read<FoodsProvider>()
              .products
              .firstWhere((element) => element.id == e['product']);

          listFoods.add({"product": food, "count": e['quantity']});

          OrderReceive order = OrderReceive(
              e['id'],
              e['order'],
              e['user'],
              food.restaurant_name,
              food.restaurant_category,
              listFoods,
              double.parse(e['amount']),
              e['quantity']);

          final item = myOrders.firstWhere(
              (element) => order.orderId == element.orderId,
              orElse: () => OrderReceive(0, 0, 0, '', '', listFoods, 0, 0));

          if (item.orderId != 0) {
            item.product.add({"product": food, "count": e['quantity']});
            item.count = item.count + e['quantity'];
            item.price = item.price + (item.count * e['quantity']);
          } else {
            myOrders.add(order);
          }
        });

        currentUser = User(
            id: result['user']['id'],
            name: "",
            email: email,
            password: password,
            phone_number: "",
            cards: [],
            token: result['jwt'],
            orderList: myOrders);

        await db.insert("user", currentUser!.toMap());

        context.router.push(MainRoute());
        notifyListeners();
      } else {
        isLoad = false;
        isAuth = false;
        notifyListeners();
      }
    } catch (e) {
      isLoad = false;
      notifyListeners();
      print(e);
      throw e;
    }
  }

  void reg(
      String name, String email, String password, BuildContext context) async {
    String url = mainUrl + 'register/';

    try {
      final responce = await http.post(Uri.parse(url),
          body: {"name": name, "email": email, "password": password});

      String body = utf8.decode(responce.bodyBytes);

      final result = json.decode(body) as Map<String, dynamic>;

      if (result['message'] == 'success') {
        isAuth = true;
        isLoad = false;
        context.router.push(LoginRoute());
        notifyListeners();
      } else {
        isLoad = false;
        notifyListeners();
      }
    } catch (e) {
      isLoad = false;
      notifyListeners();
      throw e;
    }
  }

  void logout(BuildContext context) async {
    var url = mainUrl + 'logout/';
    Database db = await DatabaseHelper().db;
    try {
      final resonce = await http.post(Uri.parse(url), headers: {
        'jwt': currentUser!.token,
      });

      String body = utf8.decode(resonce.bodyBytes);

      final result = json.decode(body) as Map<String, dynamic>;

      if (result['message'] == 'success') {
        isAuth = false;
        await db
            .rawDelete('DELETE FROM user WHERE name = ?', [currentUser!.name]);
        currentUser = null;
        context.read<CartProvider>().clearAll();
        context.router.push(LoginRoute());

        notifyListeners();
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
