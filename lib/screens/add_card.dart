import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';

class AddCartScreen extends StatefulWidget {
  AddCartScreen({Key? key}) : super(key: key);

  @override
  State<AddCartScreen> createState() => _AddCartScreenState();
}

class _AddCartScreenState extends State<AddCartScreen> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();

  late int numberCard;
  late String date;
  late int cvv;
  late String nameOfCart;

  @override
  Widget build(BuildContext context) {
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
                              "Добавить карту",
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
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Номер карты",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      TextFormField(
                        controller: _controller,
                        onChanged: (e) {
                          setState(() {
                            numberCard = int.parse(e);
                          });
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: appTextHeading),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: appTextHeading),
                              borderRadius: BorderRadius.circular(8),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "Срок выдачи",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        TextFormField(
                          controller: _controller2,
                          onChanged: (e) {
                            setState(() {
                              date = e;
                            });
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: appTextHeading),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: appTextHeading),
                                borderRadius: BorderRadius.circular(8),
                              )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "CVV",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        TextFormField(
                          controller: _controller3,
                          onChanged: (e) {
                            setState(() {
                              cvv = int.parse(e);
                            });
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: appTextHeading),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: appTextHeading),
                                borderRadius: BorderRadius.circular(8),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Имя карты",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      TextFormField(
                        onChanged: (e) {
                          setState(() {
                            nameOfCart = e;
                          });
                        },
                        controller: _controller4,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: appTextHeading),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: appTextHeading),
                              borderRadius: BorderRadius.circular(8),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: appColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1.5, color: appColor)),
              child: const Center(
                child: Text(
                  "Добавить",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
