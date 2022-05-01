// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
class _$ProductModelTearOff {
  const _$ProductModelTearOff();

  _ProductModel call(
      {required int id,
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
      required String updated_at}) {
    return _ProductModel(
      id: id,
      name: name,
      photo: photo,
      price: price,
      category_name: category_name,
      restaurant_name: restaurant_name,
      restaurant_logo: restaurant_logo,
      restaurant_category: restaurant_category,
      restaurant_delivery: restaurant_delivery,
      restaurant_delivery_price: restaurant_delivery_price,
      created_at: created_at,
      updated_at: updated_at,
    );
  }

  ProductModel fromJson(Map<String, Object?> json) {
    return ProductModel.fromJson(json);
  }
}

/// @nodoc
const $ProductModel = _$ProductModelTearOff();

/// @nodoc
mixin _$ProductModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get category_name => throw _privateConstructorUsedError;
  String get restaurant_name => throw _privateConstructorUsedError;
  String get restaurant_logo => throw _privateConstructorUsedError;
  String get restaurant_category => throw _privateConstructorUsedError;
  String get restaurant_delivery => throw _privateConstructorUsedError;
  int get restaurant_delivery_price => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String photo,
      String price,
      String category_name,
      String restaurant_name,
      String restaurant_logo,
      String restaurant_category,
      String restaurant_delivery,
      int restaurant_delivery_price,
      String created_at,
      String updated_at});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res> implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  final ProductModel _value;
  // ignore: unused_field
  final $Res Function(ProductModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photo = freezed,
    Object? price = freezed,
    Object? category_name = freezed,
    Object? restaurant_name = freezed,
    Object? restaurant_logo = freezed,
    Object? restaurant_category = freezed,
    Object? restaurant_delivery = freezed,
    Object? restaurant_delivery_price = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      category_name: category_name == freezed
          ? _value.category_name
          : category_name // ignore: cast_nullable_to_non_nullable
              as String,
      restaurant_name: restaurant_name == freezed
          ? _value.restaurant_name
          : restaurant_name // ignore: cast_nullable_to_non_nullable
              as String,
      restaurant_logo: restaurant_logo == freezed
          ? _value.restaurant_logo
          : restaurant_logo // ignore: cast_nullable_to_non_nullable
              as String,
      restaurant_category: restaurant_category == freezed
          ? _value.restaurant_category
          : restaurant_category // ignore: cast_nullable_to_non_nullable
              as String,
      restaurant_delivery: restaurant_delivery == freezed
          ? _value.restaurant_delivery
          : restaurant_delivery // ignore: cast_nullable_to_non_nullable
              as String,
      restaurant_delivery_price: restaurant_delivery_price == freezed
          ? _value.restaurant_delivery_price
          : restaurant_delivery_price // ignore: cast_nullable_to_non_nullable
              as int,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: updated_at == freezed
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(
          _ProductModel value, $Res Function(_ProductModel) then) =
      __$ProductModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String photo,
      String price,
      String category_name,
      String restaurant_name,
      String restaurant_logo,
      String restaurant_category,
      String restaurant_delivery,
      int restaurant_delivery_price,
      String created_at,
      String updated_at});
}

/// @nodoc
class __$ProductModelCopyWithImpl<$Res> extends _$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(
      _ProductModel _value, $Res Function(_ProductModel) _then)
      : super(_value, (v) => _then(v as _ProductModel));

  @override
  _ProductModel get _value => super._value as _ProductModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photo = freezed,
    Object? price = freezed,
    Object? category_name = freezed,
    Object? restaurant_name = freezed,
    Object? restaurant_logo = freezed,
    Object? restaurant_category = freezed,
    Object? restaurant_delivery = freezed,
    Object? restaurant_delivery_price = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
  }) {
    return _then(_ProductModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      category_name: category_name == freezed
          ? _value.category_name
          : category_name // ignore: cast_nullable_to_non_nullable
              as String,
      restaurant_name: restaurant_name == freezed
          ? _value.restaurant_name
          : restaurant_name // ignore: cast_nullable_to_non_nullable
              as String,
      restaurant_logo: restaurant_logo == freezed
          ? _value.restaurant_logo
          : restaurant_logo // ignore: cast_nullable_to_non_nullable
              as String,
      restaurant_category: restaurant_category == freezed
          ? _value.restaurant_category
          : restaurant_category // ignore: cast_nullable_to_non_nullable
              as String,
      restaurant_delivery: restaurant_delivery == freezed
          ? _value.restaurant_delivery
          : restaurant_delivery // ignore: cast_nullable_to_non_nullable
              as String,
      restaurant_delivery_price: restaurant_delivery_price == freezed
          ? _value.restaurant_delivery_price
          : restaurant_delivery_price // ignore: cast_nullable_to_non_nullable
              as int,
      created_at: created_at == freezed
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: updated_at == freezed
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductModel implements _ProductModel {
  _$_ProductModel(
      {required this.id,
      required this.name,
      required this.photo,
      required this.price,
      required this.category_name,
      required this.restaurant_name,
      required this.restaurant_logo,
      required this.restaurant_category,
      required this.restaurant_delivery,
      required this.restaurant_delivery_price,
      required this.created_at,
      required this.updated_at});

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String photo;
  @override
  final String price;
  @override
  final String category_name;
  @override
  final String restaurant_name;
  @override
  final String restaurant_logo;
  @override
  final String restaurant_category;
  @override
  final String restaurant_delivery;
  @override
  final int restaurant_delivery_price;
  @override
  final String created_at;
  @override
  final String updated_at;

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, photo: $photo, price: $price, category_name: $category_name, restaurant_name: $restaurant_name, restaurant_logo: $restaurant_logo, restaurant_category: $restaurant_category, restaurant_delivery: $restaurant_delivery, restaurant_delivery_price: $restaurant_delivery_price, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.photo, photo) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.category_name, category_name) &&
            const DeepCollectionEquality()
                .equals(other.restaurant_name, restaurant_name) &&
            const DeepCollectionEquality()
                .equals(other.restaurant_logo, restaurant_logo) &&
            const DeepCollectionEquality()
                .equals(other.restaurant_category, restaurant_category) &&
            const DeepCollectionEquality()
                .equals(other.restaurant_delivery, restaurant_delivery) &&
            const DeepCollectionEquality().equals(
                other.restaurant_delivery_price, restaurant_delivery_price) &&
            const DeepCollectionEquality()
                .equals(other.created_at, created_at) &&
            const DeepCollectionEquality()
                .equals(other.updated_at, updated_at));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(photo),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(category_name),
      const DeepCollectionEquality().hash(restaurant_name),
      const DeepCollectionEquality().hash(restaurant_logo),
      const DeepCollectionEquality().hash(restaurant_category),
      const DeepCollectionEquality().hash(restaurant_delivery),
      const DeepCollectionEquality().hash(restaurant_delivery_price),
      const DeepCollectionEquality().hash(created_at),
      const DeepCollectionEquality().hash(updated_at));

  @JsonKey(ignore: true)
  @override
  _$ProductModelCopyWith<_ProductModel> get copyWith =>
      __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductModelToJson(this);
  }
}

abstract class _ProductModel implements ProductModel {
  factory _ProductModel(
      {required int id,
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
      required String updated_at}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get photo;
  @override
  String get price;
  @override
  String get category_name;
  @override
  String get restaurant_name;
  @override
  String get restaurant_logo;
  @override
  String get restaurant_category;
  @override
  String get restaurant_delivery;
  @override
  int get restaurant_delivery_price;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  @JsonKey(ignore: true)
  _$ProductModelCopyWith<_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
