import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:auto_route/auto_route.dart';

import 'package:food_app/models/restaurant.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/providers/foods_provider.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantDetailScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  bool favorite = false;

  List<Product> listOfItems = [];

  double minHeightOfSheet = 0;
  int countItemsCart = 0;
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> listOfEl = context
        .read<CartProvider>()
        .getCountOfFoodsInCartItem(widget.restaurant.restaurant_name);
    totalPrice = listOfEl['total'];
    listOfItems = listOfEl['list'];
  }

  void addItem(Product item) {
    final findItem = listOfItems.firstWhere(
      (element) => element.id == item.id,
      orElse: () => Product(
          id: 0,
          name: "name",
          category_name: "category_name",
          price: "price",
          photo: "photo",
          count: 0),
    );
    if (findItem.id == 0) {
      listOfItems.add(item);
    }
  }

  void sendOrder() {
    final cart = context.read<CartProvider>().cart;

    CartItem cartItem = CartItem(
        id: Random().nextInt(1000),
        foodList: listOfItems,
        restaurant_name: widget.restaurant.restaurant_name,
        restaurant_logo: widget.restaurant.restaurant_logo,
        restaurant_category: widget.restaurant.restaurant_category,
        restaurant_delivery_price: widget.restaurant.restaurant_delivery_price,
        total: listOfItems.fold(
            0,
            (previousValue, element) =>
                previousValue + (element.count * int.parse(element.price))));

    CartItem findItem = cart.firstWhere(
        (element) => element.restaurant_name == cartItem.restaurant_name,
        orElse: () => CartItem(
            id: 0,
            foodList: [],
            restaurant_name: "",
            restaurant_logo: "",
            restaurant_category: "",
            restaurant_delivery_price: 0,
            total: 0));

    if (findItem.id != 0) {
      findItem.foodList = cartItem.foodList;
      findItem.total = cartItem.total;
      setState(() {
        listOfItems = [];
        totalPrice = 0;
        countItemsCart = 0;
      });
    } else {
      context.read<CartProvider>().addItem(cartItem);
      setState(() {
        listOfItems = [];
        totalPrice = 0;
        countItemsCart = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SlidingUpPanel(
      borderRadius: BorderRadius.circular(15),
      minHeight: minHeightOfSheet,
      panel: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Text(
                    'Кол-во: ' + listOfItems.length.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    ' | ' + totalPrice.toString() + ' сум',
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: (() => sendOrder()),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: appColor, borderRadius: BorderRadius.circular(12)),
                child: const Text(
                  'Заказать',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Stack(
              children: [
                SizedBox(
                    child: Image.network(
                  widget.restaurant.restaurant_logo,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )),
                Positioned(
                    top: 100,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                          onPressed: () {
                            context.router.pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 25,
                          )),
                    )),
                Positioned(
                    top: 100,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.restaurant,
                            color: Colors.black,
                            size: 25,
                          )),
                    )),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.15,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: 200,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: Colors.grey))),
                              child: Text(
                                widget.restaurant.restaurant_name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    favorite = !favorite;
                                  });
                                },
                                icon: Icon(
                                    favorite == false
                                        ? Icons.favorite_border
                                        : Icons.favorite,
                                    color: appColor))
                          ],
                        ),
                        Text(
                          "Время доставки: " +
                              widget.restaurant.restaurant_delivery,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Стоимость доставки: " +
                                widget.restaurant.restaurant_delivery_price
                                    .toString() +
                                ' сум',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          height: 40,
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              'Скидка 10% на все блюда',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.15,
            height: 360,
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: widget.restaurant.foods.length,
                        itemBuilder: (ctx, index) {
                          final food = widget.restaurant.foods[index];
                          bool count_visible = false;
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width / 1.15,
                            height: 110,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 90,
                                    height: 90,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          food.photo,
                                          fit: BoxFit.cover,
                                        ))),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            child: Text(
                                              food.name,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Roboto'),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 150,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                food.category_name,
                                                maxLines: 1,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: appTextHeading),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.8,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              food.price + ' сум',
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            GestureDetector(
                                                onTap: (() {
                                                  setState(() {
                                                    count_visible =
                                                        !count_visible;
                                                  });
                                                }),
                                                child: food.count < 1
                                                    ? GestureDetector(
                                                        onTap: () {
                                                          context
                                                              .read<
                                                                  FoodsProvider>()
                                                              .changeCountOfFood(
                                                                  widget
                                                                      .restaurant
                                                                      .restaurant_name,
                                                                  food.id,
                                                                  "INC");

                                                          setState(() {
                                                            minHeightOfSheet =
                                                                100.0;
                                                            listOfItems
                                                                .add(food);
                                                            totalPrice =
                                                                totalPrice +
                                                                    int.parse(food
                                                                        .price);
                                                          });
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          decoration: BoxDecoration(
                                                              color: appColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                          child: const Text(
                                                            'Добавить',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(
                                                        width: 80,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        decoration: BoxDecoration(
                                                            color: appColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                context
                                                                    .read<
                                                                        FoodsProvider>()
                                                                    .changeCountOfFood(
                                                                        widget
                                                                            .restaurant
                                                                            .restaurant_name,
                                                                        food.id,
                                                                        "DEC");
                                                                setState(() {
                                                                  if (food.count ==
                                                                      0) {
                                                                    listOfItems.removeWhere((element) =>
                                                                        element
                                                                            .id ==
                                                                        food.id);
                                                                  }
                                                                  if (totalPrice >
                                                                      0) {
                                                                    totalPrice =
                                                                        double.parse(food.price) *
                                                                            food.count;
                                                                  }
                                                                  minHeightOfSheet =
                                                                      100.0;
                                                                });
                                                              },
                                                              child: const Text(
                                                                "-",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ),
                                                            Text(
                                                              food.count
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 20),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                context
                                                                    .read<
                                                                        FoodsProvider>()
                                                                    .changeCountOfFood(
                                                                        widget
                                                                            .restaurant
                                                                            .restaurant_name,
                                                                        food.id,
                                                                        "INC");
                                                                setState(() {
                                                                  totalPrice = double
                                                                          .parse(
                                                                              food.price) *
                                                                      food.count;
                                                                  minHeightOfSheet =
                                                                      100.0;
                                                                });
                                                              },
                                                              child: const Text(
                                                                "+",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        })),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
