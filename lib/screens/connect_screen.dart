import 'package:flutter/material.dart';
import 'package:food_app/screens/login_screen.dart';
import 'package:food_app/screens/main_screen.dart';
import 'package:food_app/screens/reg_screen.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainScreen(),
    );
  }
}
