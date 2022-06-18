import 'package:flutter/material.dart';
import 'package:food_app/providers/auth_provider.dart';
import 'package:food_app/screens/login_screen.dart';
import 'package:food_app/screens/main_screen.dart';
import 'package:food_app/services/background_fetch.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({Key? key}) : super(key: key);

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  @override
  void initState() {
    super.initState();
    Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
    Workmanager().registerPeriodicTask(
      "1",
      dropUser,
      frequency: Duration(hours: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<AuthProvider>().isAuth ? MainScreen() : LoginScreen(),
    );
  }
}
