import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/providers/auth_provider.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/routes/router.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key, required this.infoCart}) : super(key: key);

  final String infoCart;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Параметры оплаты",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        Text(
                          widget.infoCart,
                          style: TextStyle(color: appTextHeading, fontSize: 17),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Все кошельки",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 0.5, color: appTextHeading)),
                              child: Image.asset(
                                "assets/images/amazon.png",
                                width: 20,
                              ),
                            ),
                            title: Text("Amazon Pay"),
                            trailing: GestureDetector(
                                child: Text("Подключить аккаунт")),
                          ),
                          ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(2),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 0.5, color: appTextHeading)),
                              child: Image.asset(
                                "assets/images/Paytm.png",
                                width: 20,
                              ),
                            ),
                            title: Text("Paytm"),
                            trailing: GestureDetector(
                                onTap: () {
                                  final phone = context
                                      .read<AuthProvider>()
                                      .currentUser!
                                      .phone_number;
                                  Alert(
                                      context: context,
                                      desc:
                                          "Привязка аккаунта к карте проходит по номеру: \n\n $phone",
                                      buttons: [
                                        DialogButton(
                                            color: appColor,
                                            child: Text("Подтвердить",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                            onPressed: () {
                                              context
                                                  .read<CartProvider>()
                                                  .changeOrderAlready();
                                              Navigator.pop(context);
                                            })
                                      ]).show();
                                },
                                child: Text("Подключить аккаунт")),
                          ),
                          ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(2),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 0.5, color: appTextHeading)),
                              child: Image.asset(
                                "assets/images/paypal.png",
                                width: 20,
                              ),
                            ),
                            title: Text("PayPal"),
                            trailing: GestureDetector(
                                onTap: () {
                                  final phone = context
                                      .read<AuthProvider>()
                                      .currentUser!
                                      .phone_number;
                                  Alert(
                                      context: context,
                                      desc:
                                          "Привязка аккаунта к карте проходит по номеру: \n\n $phone",
                                      buttons: [
                                        DialogButton(
                                            color: appColor,
                                            child: Text("Подтвердить",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                            onPressed: () {
                                              context
                                                  .read<CartProvider>()
                                                  .changeOrderAlready();
                                              Navigator.pop(context);
                                            })
                                      ]).show();
                                },
                                child: Text("Подключить аккаунт")),
                          ),
                          ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(2),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 0.5, color: appTextHeading)),
                              child: Image.asset(
                                "assets/images/google pay.png",
                              ),
                            ),
                            title: Text("Google Pay"),
                            trailing: GestureDetector(
                                onTap: () {
                                  final phone = context
                                      .read<AuthProvider>()
                                      .currentUser!
                                      .phone_number;
                                  Alert(
                                      context: context,
                                      desc:
                                          "Привязка аккаунта к карте проходит по номеру: \n\n $phone",
                                      buttons: [
                                        DialogButton(
                                            color: appColor,
                                            child: Text("Подтвердить",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17)),
                                            onPressed: () {
                                              context
                                                  .read<CartProvider>()
                                                  .changeOrderAlready();
                                              Navigator.pop(context);
                                            })
                                      ]).show();
                                },
                                child: Text("Подключить аккаунт")),
                          ),
                        ]),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Карты",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Column(
                    children: [
                      setCart(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: GestureDetector(
                          onTap: () {
                            context.router.push(AddCartRoute());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Добавить карту",
                                style: TextStyle(
                                    fontSize: 18, color: appTextHeading),
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/images/Bitmap.png"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Image.asset("assets/images/Bitmap_2.png")
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "Оплата через банк",
                                style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 0.5,
                                              color: appTextHeading)),
                                      child: Image.asset(
                                          "assets/images/Logogram.png"),
                                    ),
                                    const Text(
                                      "SC",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 0.5,
                                              color: appTextHeading)),
                                      child: Image.asset(
                                          "assets/images/Logogram_2.png"),
                                    ),
                                    const Text(
                                      "BB",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 0.5,
                                              color: appTextHeading)),
                                      child: Image.asset(
                                          "assets/images/Bank Indonesia.png"),
                                    ),
                                    const Text(
                                      "BJB",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 0.5,
                                              color: appTextHeading)),
                                      child: Image.asset(
                                          "assets/images/Logogram_3.png"),
                                    ),
                                    const Text(
                                      "CIMB",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 0.5,
                                              color: appTextHeading)),
                                      child: Image.asset(
                                          "assets/images/Logogram_4.png"),
                                    ),
                                    const Text(
                                      "HSBC",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Divider(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Все банки",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.keyboard_arrow_right))
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              "Оплата за доставку",
                              style: TextStyle(
                                  fontSize: 21,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Наличными",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        check = !check;
                                      });
                                    },
                                    child: Container(
                                        width: 25,
                                        height: 25,
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 3,
                                              color: Colors.greenAccent),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: check
                                            ? Container(
                                                width: 4,
                                                height: 4,
                                                decoration: BoxDecoration(
                                                    color: Colors.greenAccent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                              )
                                            : SizedBox()),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class setCart extends StatefulWidget {
  const setCart({
    Key? key,
  }) : super(key: key);

  @override
  State<setCart> createState() => _setCartState();
}

class _setCartState extends State<setCart> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Image.asset("assets/images/MasterCard.png"),
        title: const Text("4800-XXXX-XXXX-X8444"),
        trailing: GestureDetector(
          onTap: () {
            setState(() {
              check = !check;
            });
          },
          child: Container(
              width: 25,
              height: 25,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: appColor),
                borderRadius: BorderRadius.circular(50),
              ),
              child: check
                  ? Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(50)),
                    )
                  : SizedBox()),
        ),
      ),
    );
  }
}
