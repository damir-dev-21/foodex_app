part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<ProductModel> products;
  final List<String> categories;
  final List<ProductModel> popularFoods;
  final List restaurants;
  // final List<ProductModel> popularItems;
  // final List<ProductModel> nearbyDeals;

  ProductsLoadedState(
      {required this.products,
      required this.categories,
      required this.popularFoods,
      required this.restaurants});
}

class ProductsErrorState extends ProductsState {}
