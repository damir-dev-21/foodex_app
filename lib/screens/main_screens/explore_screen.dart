import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/products/products_bloc.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/widgets/search_and_location_widget.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
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
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoadingState) {
                  context.read<ProductsBloc>().add(LoadProductsEvent());
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductsLoadedState) {
                  return buildCategoryModel(state.categories);
                } else if (state is ProductsErrorState) {
                  return const Center(child: Text('Something was wrong!'));
                }

                return const Text("Not data");
              },
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
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoadingState) {
                  context.read<ProductsBloc>().add(LoadProductsEvent());
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductsLoadedState) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.popularFoods.length,
                      itemBuilder: (BuildContext context, int index) {
                        final ProductModel restaurant =
                            state.popularFoods[index];

                        return Container(
                          padding: const EdgeInsets.only(right: 20),
                          decoration: const BoxDecoration(color: Colors.white),
                          margin: const EdgeInsets.only(right: 10),
                          child: Row(
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
                                    restaurant.photo,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(restaurant.name),
                                  Text(
                                    'От ' + restaurant.restaurant_name,
                                    style:
                                        const TextStyle(color: appTextHeading),
                                  ),
                                  Container(
                                    color: appTextHeading,
                                    width: 20,
                                    height: 2,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(restaurant.price + ' сум')
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is ProductsErrorState) {
                  return const Center(child: Text('Something was wrong!'));
                }

                return const Text("Not data");
              },
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
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoadingState) {
                  context.read<ProductsBloc>().add(LoadProductsEvent());
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductsLoadedState) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.restaurants.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Map<String, dynamic> restaurant =
                            state.restaurants[index];

                        return Padding(
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
                                    restaurant['logo'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  restaurant["name"].toString(),
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is ProductsErrorState) {
                  return const Center(child: Text('Something was wrong!'));
                }

                return const Text("Not data");
              },
            ),
          ],
        ),
      ),
    ));
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
