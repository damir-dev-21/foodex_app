import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/providers/foods_provider.dart';
import 'package:food_app/routes/router.dart';
import 'package:food_app/widgets/search_and_location_widget.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<FoodsProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              const SearchAndLocationWidget(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Категорий',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_alt,
                        color: appTextHeading,
                      ),
                      label: const Text(
                        'Фильтр',
                        style: TextStyle(color: appTextHeading),
                      ))
                ],
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String category = state.categories[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 20, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/images/categories/$category.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              category.toString(),
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Популярные блюда',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Показать все',
                        style: TextStyle(color: appTextHeading),
                      ))
                ],
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.popularFoods.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ProductModel restaurant = state.popularFoods[index];

                    return GestureDetector(
                      onTap: () {
                        context.router
                            .push(FoodDetailRoute(productModel: restaurant));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        margin: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  restaurant.photo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: 150,
                              margin: const EdgeInsets.only(left: 20),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(restaurant.name),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'От ' + restaurant.restaurant_name,
                                    style: const TextStyle(
                                        fontSize: 12, color: appTextHeading),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    color: appTextHeading,
                                    width: 50,
                                    height: 2,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(restaurant.price + ' сум')
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Наши предложения',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Показать все',
                        style: TextStyle(color: appTextHeading),
                      ))
                ],
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.nearbyDeals.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ProductModel restaurant = state.nearbyDeals[index];
                    // print(restaurant);
                    return GestureDetector(
                      onTap: () {
                        context.router
                            .push(FoodDetailRoute(productModel: restaurant));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  restaurant.photo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                restaurant.restaurant_name.toString(),
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: appTextHeading,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                restaurant.name.toString(),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                restaurant.price.toString() + ' сум',
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Рестораны',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Показать все',
                        style: TextStyle(color: appTextHeading),
                      ))
                ],
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.restaurants.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Restaurant restaurant = state.restaurants[index];

                    return GestureDetector(
                      onTap: () {
                        context.router.push(
                            RestaurantDetailRoute(restaurant: restaurant));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 75,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  restaurant.restaurant_logo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                restaurant.restaurant_name.toString(),
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoryModel(List<String> categories) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final String category = categories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 75,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/categories/$category.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    category.toString(),
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
