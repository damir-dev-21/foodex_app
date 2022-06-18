import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/providers/foods_provider.dart';
import 'package:food_app/routes/router.dart';
import 'package:provider/provider.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final FoodsProvider foodsProvider = context.read<FoodsProvider>();
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentPage = 0;
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: currentPage == 0
                          ? BoxDecoration(
                              color: appColor,
                              border: Border.all(color: appColor),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5)))
                          : BoxDecoration(
                              border: Border.all(color: appColor),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5))),
                      child: Center(
                        child: Text(
                          "Рестораны",
                          style: currentPage == 0
                              ? const TextStyle(
                                  color: Colors.white, fontSize: 17)
                              : const TextStyle(
                                  color: Colors.black, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentPage = 1;
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: currentPage == 1
                          ? BoxDecoration(
                              color: appColor,
                              border: Border.all(color: appColor),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5)))
                          : BoxDecoration(
                              border: Border.all(color: appColor),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5))),
                      child: Center(
                          child: Text(
                        "Промокоды",
                        style: currentPage == 1
                            ? const TextStyle(color: Colors.white, fontSize: 17)
                            : const TextStyle(
                                color: Colors.black, fontSize: 17),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            currentPage == 0
                ? Column(
                    children: [
                      Container(
                        height: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 20, top: 30),
                              child: const Text(
                                "Наши рекомендации",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                            Container(
                              height: 220,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: foodsProvider.offers.length,
                                  itemBuilder: ((context, index) {
                                    final ProductModel product =
                                        foodsProvider.offers[index];
                                    return GestureDetector(
                                      onTap: () {
                                        context.router.push(FoodDetailRoute(
                                            productModel: product));
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        width: 200,
                                        child: Column(
                                          children: [
                                            Container(
                                                height: 130,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Image.network(
                                                  product.photo,
                                                  fit: BoxFit.cover,
                                                )),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 120,
                                                    child: Text(
                                                      product.name,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                  const Text("4.1")
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  product.restaurant_delivery,
                                                  style: const TextStyle(
                                                      color: appTextHeading),
                                                ),
                                                Text(
                                                  product.price,
                                                  style: const TextStyle(
                                                      color: appTextHeading),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  })),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 350,
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 10, bottom: 20, top: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Бесплатная доставка",
                                  style: TextStyle(fontSize: 22),
                                ),
                                Text(
                                  "Показать все",
                                  style: TextStyle(color: appTextHeading),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 260,
                            child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 215,
                                        childAspectRatio: 1 / 2.5,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 30),
                                itemCount: foodsProvider.nearbyDeals.length,
                                itemBuilder: (ctx, index) {
                                  final product =
                                      foodsProvider.nearbyDeals[index];
                                  return GestureDetector(
                                    onTap: () {
                                      context.router.push(FoodDetailRoute(
                                          productModel: product));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: appTextHeading,
                                              width: 0.3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            width: 100,
                                            height: 200,
                                            child: Image.network(
                                              product.photo,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                    width: 150,
                                                    child: Text(product.name)),
                                                Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 5),
                                                    width: 100,
                                                    child: Text(
                                                      product.category_name,
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    )),
                                                Container(
                                                  width: 50,
                                                  height: 1,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.grey),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    product.price + ' сум',
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ]),
                      ),
                      Container(
                        height: 350,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 10, bottom: 20, top: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Все рекомендации",
                                  style: TextStyle(fontSize: 22),
                                ),
                                Text(
                                  "Показать все",
                                  style: TextStyle(color: appTextHeading),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: foodsProvider.popularFoods.length,
                                itemBuilder: (ctx, index) {
                                  final product =
                                      foodsProvider.popularFoods[index];
                                  return GestureDetector(
                                    onTap: () {
                                      context.router.push(FoodDetailRoute(
                                          productModel: product));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.only(bottom: 15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: appTextHeading,
                                              width: 0.3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            width: 100,
                                            height: 100,
                                            child: Image.network(
                                              product.photo,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                    width: 150,
                                                    child: Text(product.name)),
                                                Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 5),
                                                    width: 100,
                                                    child: Text(
                                                      product.category_name,
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    )),
                                                Container(
                                                  width: 50,
                                                  height: 1,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.grey),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    product.price + ' сум',
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ]),
                      )
                    ],
                  )
                : Column(
                    children: const [
                      SizedBox(
                        height: 30,
                      ),
                      promo(
                        img: "assets/images/Paytm.png",
                        namePromo: "FREEDELPTM",
                        textPromo: "Get Unlimited free delivery using paytm",
                      ),
                      promo(
                        img: "assets/images/FreeCharge_Logo.png",
                        namePromo: "FIRSTUSER",
                        textPromo: "Free delivery for the first time users",
                      ),
                      promo(
                        img: "assets/images/download.png",
                        namePromo: "Delivery",
                        textPromo: "Free delivery for the first time users",
                      ),
                    ],
                  )
          ],
        ),
      ),
    ));
  }
}

class promo extends StatefulWidget {
  const promo({
    Key? key,
    required this.img,
    required this.namePromo,
    required this.textPromo,
  }) : super(key: key);

  final String img;
  final String namePromo;
  final String textPromo;

  @override
  State<promo> createState() => _promoState();
}

class _promoState extends State<promo> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(widget.img),
              DottedBorder(
                color: appColor,
                borderType: BorderType.Rect,
                dashPattern: [6, 1],
                padding: const EdgeInsets.all(10),
                strokeWidth: 1.5,
                child: Text(
                  widget.namePromo,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              widget.textPromo,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          show
              ? Container(
                  child: const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: appTextHeading),
                  ),
                )
              : SizedBox(),
          TextButton.icon(
              onPressed: () {
                setState(() {
                  show = !show;
                });
              },
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.white)),
              icon: Icon(
                show ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: Colors.black,
              ),
              label: Text(
                show ? "Close" : "Expand",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ))
        ],
      ),
    );
  }
}
