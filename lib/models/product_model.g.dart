// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as int,
      name: json['name'] as String,
      photo: json['photo'] as String,
      price: json['price'] as String,
      category_name: json['category_name'] as String,
      restaurant_name: json['restaurant_name'] as String,
      restaurant_logo: json['restaurant_logo'] as String,
      restaurant_category: json['restaurant_category'] as String,
      restaurant_delivery: json['restaurant_delivery'] as String,
      restaurant_delivery_price: json['restaurant_delivery_price'] as int,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'price': instance.price,
      'category_name': instance.category_name,
      'restaurant_name': instance.restaurant_name,
      'restaurant_logo': instance.restaurant_logo,
      'restaurant_category': instance.restaurant_category,
      'restaurant_delivery': instance.restaurant_delivery,
      'restaurant_delivery_price': instance.restaurant_delivery_price,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
