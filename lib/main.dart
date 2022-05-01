import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/products/products_bloc.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/screens/connect_screen.dart';
import 'package:food_app/services/getProductsAPI.dart';

void main() {
  runApp(BlocProvider<ProductsBloc>(
      create: (context) => ProductsBloc(GetProductsApi()), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      theme: ThemeData(scaffoldBackgroundColor: appBackgroundColor),
      home: ConnectScreen(),
    );
  }
}
