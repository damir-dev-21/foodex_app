// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    required int id,
    required String name,
    required String photo,
    required String price,
    required String category_name,
    required String restaurant_name,
    required String restaurant_logo,
    required String restaurant_category,
    required String restaurant_delivery,
    required int restaurant_delivery_price,
    required String created_at,
    required String updated_at,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  // Map<String, dynamic> toMap() {
  //   return {
  //     "id": id,
  //     "name": name,
  //     "photo": photo,
  //     "price": price,
  //     "category_name": category_name,
  //     "restaurant_name": restaurant_name,
  //     "restaurant_logo": restaurant_logo,
  //     "restaurant_category": restaurant_category,
  //     "restaurant_delivery": restaurant_delivery,
  //     "restaurant_delivery_price": restaurant_delivery_price,
  //     "created_at": created_at,
  //     "updated_at": updated_at
  //   };
  // }
}
