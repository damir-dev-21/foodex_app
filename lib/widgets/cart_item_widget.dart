import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/providers/foods_provider.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    Key? key,
    required this.restaurant,
  }) : super(key: key);
  final CartItem restaurant;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Stack(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(15),
                leading: Image.network(
                  widget.restaurant.restaurant_logo,
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.restaurant.restaurant_name,
                      style: const TextStyle(fontSize: 14),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        widget.restaurant.restaurant_category,
                        style: const TextStyle(
                            fontSize: 11, color: appTextHeading),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _expanded = !_expanded;
                          });
                        },
                        child: Container(
                          child: Row(
                            children: [
                              const Text(
                                'Подробнее',
                                style: TextStyle(
                                    color: appTextHeading, fontSize: 12),
                              ),
                              Icon(
                                _expanded
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                                color: appTextHeading,
                                size: 18,
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
                trailing: Text(widget.restaurant.total.toString()),
              ),
              Positioned(
                  top: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<CartProvider>()
                          .deleteCartItem(widget.restaurant.id);
                      context
                          .read<FoodsProvider>()
                          .clearCountFood(widget.restaurant.restaurant_name);
                    },
                    child: Icon(
                      Icons.cancel,
                      color: appTextHeading,
                      size: 15,
                    ),
                  ))
            ],
          ),
          if (_expanded)
            Container(
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                  width: 0.1,
                ))),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                height:
                    min(widget.restaurant.foodList.length * 100.0 + 10, 100),
                child: ListView(
                  children: widget.restaurant.foodList
                      .map((food) => ListTile(
                            leading: CircleAvatar(
                              child: Image.network(
                                food.photo,
                                fit: BoxFit.cover,
                                width: 40,
                                height: 40,
                              ),
                            ),
                            title: SizedBox(
                                width: 10,
                                child: Text(
                                  food.name,
                                  style: const TextStyle(fontSize: 14),
                                )),
                            subtitle: Row(
                              children: [
                                Text(
                                  "Цена: " + food.price + ' сум',
                                  style: const TextStyle(fontSize: 12),
                                ),
                                Text(
                                  " | Кол-во: " + food.count.toString(),
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  context
                                      .read<CartProvider>()
                                      .deleteFoodFromCartItem(
                                          food.id, widget.restaurant.id);
                                  context
                                      .read<FoodsProvider>()
                                      .cleanCountFoodItem(food.id,
                                          widget.restaurant.restaurant_name);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: appColor,
                                  size: 23,
                                )),
                          ))
                      .toList(),
                ))
        ],
      ),
    );
  }
}
