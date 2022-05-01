import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  bool isObsured = true;
  // FToast ftoast;

  String name = '';
  String email = '';
  String password = '';
  String repeatPassword = '';

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
            const Text('Регистрация',
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
                onChanged: (e) {},
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
              height: 15,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Повторите пароль',
                    style: TextStyle(fontSize: 16),
                  ),
                )),
            Container(
              child: TextField(
                keyboardType: TextInputType.text,
                onChanged: (text) => {
                  setState(() {
                    repeatPassword = text;
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
                    labelText: 'Повторите пароль ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: appColor, borderRadius: BorderRadius.circular(6)),
                  child: const Center(
                    child: Text(
                      'Зарегистрироваться',
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
                      label: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: const Text(
                          'Google',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 45, 45, 45),
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                ),
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
                              (states) => Color(0xFF1777F2))),
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/facebook_logo.png',
                        color: Colors.white,
                        fit: BoxFit.cover,
                        height: 20,
                      ),
                      label: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: const Text(
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
                    'Уже есть аккаунт? ',
                    style: TextStyle(color: appTextHeading),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Войти',
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
