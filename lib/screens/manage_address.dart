import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';

class ManageAddressScreen extends StatefulWidget {
  ManageAddressScreen({Key? key}) : super(key: key);

  @override
  State<ManageAddressScreen> createState() => _ManageAddressScreenState();
}

class _ManageAddressScreenState extends State<ManageAddressScreen> {
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
                              "Изменить адрес доставки",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
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
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.home,
                              color: appTextHeading,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                "Home",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            "43-D San Francisco, near Church USA",
                            style:
                                TextStyle(color: appTextHeading, fontSize: 16),
                          ),
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.3,
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(width: 1.5, color: appColor)),
                              child: const Center(
                                child: Text(
                                  "Изменить",
                                  style:
                                      TextStyle(fontSize: 17, color: appColor),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.3,
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(width: 1.5, color: appColor)),
                              child: const Center(
                                child: Text(
                                  "Удалить",
                                  style:
                                      TextStyle(fontSize: 17, color: appColor),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.work,
                              color: appTextHeading,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                "Work",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            "43-D San Francisco, near Church USA",
                            style:
                                TextStyle(color: appTextHeading, fontSize: 16),
                          ),
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.3,
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(width: 1.5, color: appColor)),
                              child: const Center(
                                child: Text(
                                  "Изменить",
                                  style:
                                      TextStyle(fontSize: 17, color: appColor),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.3,
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(width: 1.5, color: appColor)),
                              child: const Center(
                                child: Text(
                                  "Удалить",
                                  style:
                                      TextStyle(fontSize: 17, color: appColor),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: appColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1.5, color: appColor)),
              child: const Center(
                child: Text(
                  "Добавить",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
