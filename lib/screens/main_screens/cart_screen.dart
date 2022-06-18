import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/providers/auth_provider.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/routes/router.dart';
import 'package:food_app/screens/payment_screen.dart';
import 'package:food_app/services/getProductsAPI.dart';
import 'package:food_app/widgets/cart_item_widget.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController _controller = TextEditingController();
  FocusNode _node = FocusNode();
  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    double total = cartProvider.cart
        .fold(0, (previousValue, element) => previousValue + element.total);
    double res_charge = (total * 3) / 100;
    double delivery = (total * 1) / 100;
    double topay = total + res_charge + delivery;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBackgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text('Корзина', style: TextStyle(color: Colors.black)),
          // leading: IconButton(
          //     onPressed: () {
          //       context.router.pop();
          //     },
          //     icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
        ),
        body: SafeArea(
            child: cartProvider.cart.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: cartProvider.cart.length,
                              itemBuilder: ((context, index) {
                                final cartItem = cartProvider.cart[index];

                                return CartItemWidget(restaurant: cartItem);
                              }))),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.30,
                        child: Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Детали заказа",
                                  style: TextStyle(fontSize: 22),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Общая сумма',
                                        style: TextStyle(
                                            color: appTextHeading,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        total.toString() + ' сум',
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Доля ресторана',
                                        style: TextStyle(
                                            color: appTextHeading,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        res_charge.toString() + ' сум',
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Доставка',
                                      style: TextStyle(color: appTextHeading),
                                    ),
                                    Text(
                                      delivery.toString() + ' сум',
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Скидка',
                                        style: TextStyle(color: appTextHeading),
                                      ),
                                      Text('0.0' + ' сум')
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Итого к оплате",
                                        style: TextStyle(fontSize: 22),
                                      ),
                                      Text(
                                        topay.toString() + ' сум',
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 5, right: 5, left: 5),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(
                                        bottom: 10, right: 10, left: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: const [
                                                Icon(Icons.delivery_dining),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8.0),
                                                  child: Text(
                                                    "Адрес доставки",
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            TextButton(
                                                onPressed: () {},
                                                child: const Text("Изменить"))
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3),
                                          child: const Text(
                                            "Адрес не заполнен в профиле!",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        context
                                                .read<CartProvider>()
                                                .orderAlready
                                            ? GestureDetector(
                                                onTap: () async {
                                                  var currentUser = context
                                                      .read<AuthProvider>()
                                                      .currentUser;
                                                  if (currentUser!
                                                          .phone_number !=
                                                      "") {
                                                    Future<bool> statusOrder =
                                                        context
                                                            .read<
                                                                CartProvider>()
                                                            .sendOrder(
                                                                currentUser.id,
                                                                currentUser
                                                                    .phone_number,
                                                                currentUser
                                                                    .token);
                                                    if (await statusOrder) {
                                                      Alert(
                                                              context: context,
                                                              type: AlertType
                                                                  .success,
                                                              buttons: [
                                                                DialogButton(
                                                                    child:
                                                                        const Text(
                                                                      "OK",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      context
                                                                          .router
                                                                          .pop();
                                                                    })
                                                              ],
                                                              title:
                                                                  "Ваш заказ оформлен",
                                                              desc: "Ждите звонок на номер \n\n" +
                                                                  currentUser
                                                                      .phone_number)
                                                          .show();
                                                      cartProvider.clearAll();
                                                    } else {
                                                      Alert(
                                                              context: context,
                                                              type: AlertType
                                                                  .error,
                                                              buttons: [
                                                                DialogButton(
                                                                    child:
                                                                        const Text(
                                                                      "OK",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      context
                                                                          .router
                                                                          .pop();
                                                                    })
                                                              ],
                                                              title:
                                                                  "Произошла ошибка",
                                                              desc:
                                                                  "Попробуйте оформить заказ снова")
                                                          .show();
                                                    }
                                                  } else {
                                                    Alert(
                                                            context: context,
                                                            type:
                                                                AlertType.info,
                                                            buttons: [
                                                              DialogButton(
                                                                  child:
                                                                      const Text(
                                                                    "OK",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    context
                                                                        .router
                                                                        .pop();
                                                                  })
                                                            ],
                                                            title:
                                                                "Номер телефона не заполнен",
                                                            desc:
                                                                "Заполните номер телефона")
                                                        .show();
                                                  }
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15,
                                                      vertical: 10),
                                                  decoration: BoxDecoration(
                                                      color: appColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: const Center(
                                                    child: Text(
                                                        'Оформить заказ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16)),
                                                  ),
                                                ),
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  context.router.push(PaymentRoute(
                                                      infoCart:
                                                          "${cartProvider.cart.length} кол-во, к оплате: ${topay} сум"));
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15,
                                                      vertical: 10),
                                                  decoration: BoxDecoration(
                                                      color: appColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: const Center(
                                                    child: Text(
                                                        'Выбрать способ оплаты',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16)),
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : Center(
                    child: Text("Корзина пуста"),
                  )));
  }
}
