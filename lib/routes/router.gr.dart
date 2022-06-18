// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    ConnectRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ConnectScreen());
    },
    MainRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const MainScreen());
    },
    FoodDetailRoute.name: (routeData) {
      final args = routeData.argsAs<FoodDetailRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              FoodDetailScreen(key: args.key, productModel: args.productModel));
    },
    RestaurantDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RestaurantDetailRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: RestaurantDetailScreen(
              key: args.key, restaurant: args.restaurant));
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginScreen());
    },
    RegRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const RegScreen());
    },
    ExploreRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ExploreScreen());
    },
    OffersRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const OffersScreen());
    },
    CartRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CartScreen());
    },
    ProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfileScreen());
    },
    PaymentRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: PaymentScreen(key: args.key, infoCart: args.infoCart));
    },
    MyOrdersRoute.name: (routeData) {
      final args = routeData.argsAs<MyOrdersRouteArgs>(
          orElse: () => const MyOrdersRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: MyOrdersScreen(key: args.key));
    },
    ManageAddressRoute.name: (routeData) {
      final args = routeData.argsAs<ManageAddressRouteArgs>(
          orElse: () => const ManageAddressRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: ManageAddressScreen(key: args.key));
    },
    AddCartRoute.name: (routeData) {
      final args = routeData.argsAs<AddCartRouteArgs>(
          orElse: () => const AddCartRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: AddCartScreen(key: args.key));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(ConnectRoute.name, path: '/'),
        RouteConfig(MainRoute.name, path: '/main-screen'),
        RouteConfig(FoodDetailRoute.name, path: '/food-detail-screen'),
        RouteConfig(RestaurantDetailRoute.name,
            path: '/restaurant-detail-screen'),
        RouteConfig(LoginRoute.name, path: '/login-screen'),
        RouteConfig(RegRoute.name, path: '/reg-screen'),
        RouteConfig(ExploreRoute.name, path: '/explore-screen'),
        RouteConfig(OffersRoute.name, path: '/offers-screen'),
        RouteConfig(CartRoute.name, path: '/cart-screen'),
        RouteConfig(ProfileRoute.name, path: '/profile-screen'),
        RouteConfig(PaymentRoute.name, path: '/payment-screen'),
        RouteConfig(MyOrdersRoute.name, path: '/my-orders-screen'),
        RouteConfig(ManageAddressRoute.name, path: '/manage-address-screen'),
        RouteConfig(AddCartRoute.name, path: '/add-cart-screen')
      ];
}

/// generated route for
/// [ConnectScreen]
class ConnectRoute extends PageRouteInfo<void> {
  const ConnectRoute() : super(ConnectRoute.name, path: '/');

  static const String name = 'ConnectRoute';
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/main-screen');

  static const String name = 'MainRoute';
}

/// generated route for
/// [FoodDetailScreen]
class FoodDetailRoute extends PageRouteInfo<FoodDetailRouteArgs> {
  FoodDetailRoute({Key? key, required ProductModel productModel})
      : super(FoodDetailRoute.name,
            path: '/food-detail-screen',
            args: FoodDetailRouteArgs(key: key, productModel: productModel));

  static const String name = 'FoodDetailRoute';
}

class FoodDetailRouteArgs {
  const FoodDetailRouteArgs({this.key, required this.productModel});

  final Key? key;

  final ProductModel productModel;

  @override
  String toString() {
    return 'FoodDetailRouteArgs{key: $key, productModel: $productModel}';
  }
}

/// generated route for
/// [RestaurantDetailScreen]
class RestaurantDetailRoute extends PageRouteInfo<RestaurantDetailRouteArgs> {
  RestaurantDetailRoute({Key? key, required Restaurant restaurant})
      : super(RestaurantDetailRoute.name,
            path: '/restaurant-detail-screen',
            args: RestaurantDetailRouteArgs(key: key, restaurant: restaurant));

  static const String name = 'RestaurantDetailRoute';
}

class RestaurantDetailRouteArgs {
  const RestaurantDetailRouteArgs({this.key, required this.restaurant});

  final Key? key;

  final Restaurant restaurant;

  @override
  String toString() {
    return 'RestaurantDetailRouteArgs{key: $key, restaurant: $restaurant}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-screen');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [RegScreen]
class RegRoute extends PageRouteInfo<void> {
  const RegRoute() : super(RegRoute.name, path: '/reg-screen');

  static const String name = 'RegRoute';
}

/// generated route for
/// [ExploreScreen]
class ExploreRoute extends PageRouteInfo<void> {
  const ExploreRoute() : super(ExploreRoute.name, path: '/explore-screen');

  static const String name = 'ExploreRoute';
}

/// generated route for
/// [OffersScreen]
class OffersRoute extends PageRouteInfo<void> {
  const OffersRoute() : super(OffersRoute.name, path: '/offers-screen');

  static const String name = 'OffersRoute';
}

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute() : super(CartRoute.name, path: '/cart-screen');

  static const String name = 'CartRoute';
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/profile-screen');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [PaymentScreen]
class PaymentRoute extends PageRouteInfo<PaymentRouteArgs> {
  PaymentRoute({Key? key, required String infoCart})
      : super(PaymentRoute.name,
            path: '/payment-screen',
            args: PaymentRouteArgs(key: key, infoCart: infoCart));

  static const String name = 'PaymentRoute';
}

class PaymentRouteArgs {
  const PaymentRouteArgs({this.key, required this.infoCart});

  final Key? key;

  final String infoCart;

  @override
  String toString() {
    return 'PaymentRouteArgs{key: $key, infoCart: $infoCart}';
  }
}

/// generated route for
/// [MyOrdersScreen]
class MyOrdersRoute extends PageRouteInfo<MyOrdersRouteArgs> {
  MyOrdersRoute({Key? key})
      : super(MyOrdersRoute.name,
            path: '/my-orders-screen', args: MyOrdersRouteArgs(key: key));

  static const String name = 'MyOrdersRoute';
}

class MyOrdersRouteArgs {
  const MyOrdersRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MyOrdersRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ManageAddressScreen]
class ManageAddressRoute extends PageRouteInfo<ManageAddressRouteArgs> {
  ManageAddressRoute({Key? key})
      : super(ManageAddressRoute.name,
            path: '/manage-address-screen',
            args: ManageAddressRouteArgs(key: key));

  static const String name = 'ManageAddressRoute';
}

class ManageAddressRouteArgs {
  const ManageAddressRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ManageAddressRouteArgs{key: $key}';
  }
}

/// generated route for
/// [AddCartScreen]
class AddCartRoute extends PageRouteInfo<AddCartRouteArgs> {
  AddCartRoute({Key? key})
      : super(AddCartRoute.name,
            path: '/add-cart-screen', args: AddCartRouteArgs(key: key));

  static const String name = 'AddCartRoute';
}

class AddCartRouteArgs {
  const AddCartRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AddCartRouteArgs{key: $key}';
  }
}
