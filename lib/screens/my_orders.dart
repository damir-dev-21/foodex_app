import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/models/order_model.dart';
import 'package:food_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class MyOrdersScreen extends StatefulWidget {
  MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final myOrders = context.read<AuthProvider>().currentUser?.orderList;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        context.router.pop();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Мои заказы",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: myOrders!.length,
                    itemBuilder: (ctx, index) {
                      final OrderReceive order = myOrders[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      order.restaurant_name,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                    Text(
                                      order.restaurant_category,
                                      style: TextStyle(
                                          fontSize: 15, color: appTextHeading),
                                    )
                                  ],
                                ),
                                Text(
                                  (order.price).toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Colors.black),
                                )
                              ],
                            ),
                            const Divider(),
                            SizedBox(
                              height: 50,
                              child: Expanded(
                                  child: ListView.builder(
                                      itemCount: order.product.length,
                                      itemBuilder: (ctx, index) {
                                        final food = order.product[index];
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${food['product'].name}, ${food['count']}'),
                                          ],
                                        );
                                      })),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Text("01 Feb 2019, 05:11 PM"),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(width: 1.5, color: appColor)),
                              child: Text(
                                "Заказать снова",
                                style: TextStyle(fontSize: 17, color: appColor),
                              ),
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
