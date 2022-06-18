import 'package:food_app/models/order_model.dart';

class User {
  final int id;
  final String name;
  String email;
  final String password;
  String phone_number;
  final List<String> cards;
  final String token;
  final List<OrderReceive> orderList;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.phone_number,
      required this.cards,
      required this.token,
      required this.orderList});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone_number': phone_number,
      'token': token,
    };
  }
}
