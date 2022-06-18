// ignore_for_file: non_constant_identifier_names

class Restaurant {
  final String restaurant_name;
  final String restaurant_logo;
  final String restaurant_category;
  final String restaurant_delivery;
  final int restaurant_delivery_price;
  final List<Product> foods;

  Restaurant(
      {required this.restaurant_name,
      required this.restaurant_category,
      required this.restaurant_delivery,
      required this.restaurant_delivery_price,
      required this.restaurant_logo,
      required this.foods});
}

class Product {
  final int id;
  final String name;
  final String category_name;
  final String price;
  final String photo;
  int count = 0;

  Product(
      {required this.id,
      required this.name,
      required this.category_name,
      required this.price,
      required this.photo,
      required this.count});
}

class CartItem {
  final int id;
  List<Product> foodList;
  final String restaurant_name;
  final String restaurant_logo;
  final String restaurant_category;
  final int restaurant_delivery_price;
  double total;

  CartItem(
      {required this.id,
      required this.foodList,
      required this.restaurant_name,
      required this.restaurant_logo,
      required this.restaurant_category,
      required this.restaurant_delivery_price,
      required this.total});
}
