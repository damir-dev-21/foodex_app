import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/providers/auth_provider.dart';
import 'package:food_app/routes/router.dart';
import 'package:food_app/screens/reg_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObsured = true;
  // FToast ftoast;

  String name = '';
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    // ftoast = FToast();
    // ftoast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Войти',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 30,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Email',
                    style: TextStyle(fontSize: 16),
                  ),
                )),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (e) {
                  setState(() {
                    email = e;
                  });
                },
                decoration: InputDecoration(
                    labelText: 'Email пользователя',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Пароль',
                    style: TextStyle(fontSize: 16),
                  ),
                )),
            Container(
              child: TextField(
                keyboardType: TextInputType.text,
                onChanged: (text) => {
                  setState(() {
                    password = text;
                  })
                },
                obscureText: isObsured,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    suffixIcon: IconButton(
                      icon: Icon(
                          isObsured ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isObsured = !isObsured;
                        });
                      },
                    ),
                    labelText: 'Пароль ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Забыли пароль?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                context.read<AuthProvider>().login(email, password, context);
              },
              child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: appColor, borderRadius: BorderRadius.circular(6)),
                  child: const Center(
                    child: Text(
                      'Войти',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 17,
            ),
            const Text(
              'или',
              style: TextStyle(color: appTextHeading, fontSize: 18),
            ),
            SizedBox(
              height: 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.3,
                  height: 45,
                  child: TextButton.icon(
                      style: ButtonStyle(
                          elevation:
                              MaterialStateProperty.resolveWith((states) => 2),
                          shadowColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.black),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white)),
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/google_logo.png',
                        fit: BoxFit.cover,
                        height: 20,
                      ),
                      label: const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Google',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 45, 45, 45),
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.3,
                  height: 45,
                  child: TextButton.icon(
                      style: ButtonStyle(
                          elevation:
                              MaterialStateProperty.resolveWith((states) => 2),
                          shadowColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.black),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => const Color(0xFF1777F2))),
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/facebook_logo.png',
                        color: Colors.white,
                        fit: BoxFit.cover,
                        height: 20,
                      ),
                      label: const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Facebook',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Нету пользователя? ',
                    style: TextStyle(color: appTextHeading),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.router.push(RegRoute());
                    },
                    child: const Text(
                      'Зарегистрируйтесь',
                      style: TextStyle(color: appColor),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
