import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../models/restaurant.dart';

class FoodDetailScreen extends StatefulWidget {
  final ProductModel productModel;
  const FoodDetailScreen({Key? key, required this.productModel})
      : super(key: key);

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int count = 1;

  void addItemToCart() {
    Product product = Product(
        id: widget.productModel.id,
        name: widget.productModel.name,
        category_name: widget.productModel.category_name,
        price: widget.productModel.price,
        photo: widget.productModel.photo,
        count: count);

    CartItem cartItem = CartItem(
        id: Random().nextInt(1000),
        foodList: [product],
        restaurant_name: widget.productModel.restaurant_name,
        restaurant_logo: widget.productModel.restaurant_logo,
        restaurant_category: widget.productModel.restaurant_category,
        restaurant_delivery_price:
            widget.productModel.restaurant_delivery_price,
        total: double.parse(widget.productModel.price) * count);

    context
        .read<CartProvider>()
        .addItemFromOneItem(widget.productModel.id, cartItem, count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () => addItemToCart(),
        child: Container(
          margin: const EdgeInsets.all(20),
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
              color: appColor, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  'Добавить в корзину',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  widget.productModel.photo,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 50,
                left: 10,
                child: Row(
                  children: [
                    IconButton(
                        iconSize: 35,
                        onPressed: () {
                          context.router.pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        widget.productModel.name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: "Roboto"),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        'От ' + widget.productModel.restaurant_name,
                        style: const TextStyle(
                            color: appTextHeading, fontSize: 17),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.productModel.price + ' сум',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: appColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (count > 1) {
                                      count -= 1;
                                    }
                                  });
                                },
                                child: const Text(
                                  '-',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            Text(
                              count.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 22),
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    count += 1;
                                  });
                                },
                                child: const Text(
                                  '+',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Text(
                    'Описание',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Dictumst quisque sagittis purus sit amet volutpat consequat mauris nunc congue nisi vitae suscipit tellus mauris a diam maecenas sed enim ut sem viverra aliquet',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
