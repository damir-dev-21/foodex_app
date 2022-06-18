import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/screens/add_card.dart';
import 'package:food_app/screens/connect_screen.dart';
import 'package:food_app/screens/details_screens/food_detail_screen.dart';
import 'package:food_app/screens/details_screens/restaurant_detail_screen.dart';
import 'package:food_app/screens/login_screen.dart';
import 'package:food_app/screens/main_screen.dart';
import 'package:food_app/screens/main_screens/cart_screen.dart';
import 'package:food_app/screens/main_screens/explore_screen.dart';
import 'package:food_app/screens/main_screens/offers_screen.dart';
import 'package:food_app/screens/main_screens/profile_screen.dart';
import 'package:food_app/screens/manage_address.dart';
import 'package:food_app/screens/my_orders.dart';
import 'package:food_app/screens/payment_screen.dart';
import 'package:food_app/screens/reg_screen.dart';

import '../models/product_model.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: ConnectScreen, initial: true),
    AutoRoute(page: MainScreen),
    AutoRoute(page: FoodDetailScreen),
    AutoRoute(page: RestaurantDetailScreen),
    AutoRoute(page: LoginScreen),
    AutoRoute(page: RegScreen),
    AutoRoute(page: ExploreScreen),
    AutoRoute(page: OffersScreen),
    AutoRoute(page: CartScreen),
    AutoRoute(page: ProfileScreen),
    AutoRoute(page: PaymentScreen),
    AutoRoute(page: MyOrdersScreen),
    AutoRoute(page: ManageAddressScreen),
    AutoRoute(page: AddCartScreen),
  ],
)
class AppRouter extends _$AppRouter {}
