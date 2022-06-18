import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';

class ModalWindow extends StatefulWidget {
  ModalWindow({Key? key}) : super(key: key);

  @override
  State<ModalWindow> createState() => _ModalWindowState();
}

class _ModalWindowState extends State<ModalWindow> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  String number = "";
  String code = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      height: 410,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Изменить аккаунт",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 5),
            child: Text(
              "Номер телефона",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 0.5, color: appTextHeading)),
                child: CountryCodePicker(
                  onChanged: (e) {
                    setState(() {
                      code = e.dialCode!;
                    });
                  },
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: 'UZ',
                  favorite: const ['+998', 'UZ'],
                  // optional. Shows only country name and flag
                  showCountryOnly: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                  // optional. aligns the flag and the Text left
                  alignLeft: false,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controller,
                    onChanged: (e) {
                      setState(() {
                        number = e;
                      });
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0.5, color: appTextHeading),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: appTextHeading),
                          borderRadius: BorderRadius.circular(8),
                        )),
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 5),
            child: Text(
              "Email",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: _controller2,
              onChanged: (e) {
                setState(() {
                  email = e;
                });
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0.5, color: appTextHeading),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1, color: appTextHeading),
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          GestureDetector(
            onTap: () {
              var phoneNumber = code + number;
              context.read<AuthProvider>().changeUser(email, phoneNumber);
              Navigator.pop(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: appColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1.5, color: appColor)),
              child: const Center(
                child: Text(
                  "Продолжить",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
