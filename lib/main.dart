import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/providers/auth_provider.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/providers/foods_provider.dart';
import 'package:food_app/routes/router.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final FoodsProvider foodsProvider = FoodsProvider();
  final AuthProvider authProvider = AuthProvider();
  foodsProvider.get_data_from_api();
  authProvider.checkAuth();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => foodsProvider),
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(
        create: (_) => authProvider,
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      theme: ThemeData(scaffoldBackgroundColor: appBackgroundColor),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
