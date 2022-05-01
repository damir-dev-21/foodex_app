import 'package:bloc/bloc.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/services/getProductsAPI.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsApi getProductsApi;

  ProductsBloc(this.getProductsApi) : super(ProductsLoadingState()) {
    on<ProductsEvent>((event, emit) async {
      if (event is LoadProductsEvent) {
        emit(ProductsLoadingState());
        List<ProductModel>? apiResult = await getProductsApi.getProducts();
        List<String> categories = getProductsApi.getCategories(apiResult!);
        List<ProductModel> popularFood =
            getProductsApi.getPopularItems(apiResult);
        List restaurants = getProductsApi.getRestaurants(apiResult);
        if (apiResult == null) {
          emit(ProductsErrorState());
        } else {
          emit(ProductsLoadedState(
              products: apiResult,
              categories: categories,
              popularFoods: popularFood,
              restaurants: restaurants));
        }
      }
    });
  }

  // void _onLoadProducts(
  //     LoadProductsEvent event, Emitter<ProductsState> emit) async {
  //   emit(ProductsLoadingState());
  //   List<ProductModel>? products = await getProductsApi.getProducts();
  //   if (products != null) {
  //     emit(ProductsLoadedState(products: products));
  //   }
  // }
}
