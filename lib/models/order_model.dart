import 'package:food_app/models/product_model.dart';

class OrderReceive {
  final int id;
  final int orderId;
  final int userId;
  final String restaurant_name;
  final String restaurant_category;
  final List<Map<String, dynamic>> product;
  double price;
  var count;

  OrderReceive(this.id, this.orderId, this.userId, this.restaurant_name,
      this.restaurant_category, this.product, this.price, this.count);
}

class Order {
  final int buyer;
  final List<CartSend> cart;
  bool success;
  final String phone_number;

  Order(this.buyer, this.cart, this.success, this.phone_number);

  Map<String, dynamic> toMap() {
    return {
      "buyer": buyer,
      "cart": toListMap(),
      "success": success,
      "phone_number": phone_number.toString()
    };
  }

  List<Map<String, dynamic>> toListMap() {
    List<Map<String, dynamic>> list = [];
    for (var element in cart) {
      list.add(element.toMap());
    }
    return list;
  }
}

class CartSend {
  final int product;
  final int quantity;
  final String amount;

  CartSend(this.product, this.quantity, this.amount);

  Map<String, dynamic> toMap() {
    return {"product": product, "quantity": quantity, "amount": amount};
  }
}
