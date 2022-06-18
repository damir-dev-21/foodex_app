import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/models/user_model.dart';
import 'package:food_app/providers/auth_provider.dart';
import 'package:food_app/routes/router.dart';
import 'package:food_app/widgets/modal_window.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:food_app/screens/my_orders.dart';
import 'package:food_app/screens/payment_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthProvider>();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      context.router.pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            user.currentUser!.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 33.0),
                            child: TextButton(
                                onPressed: () {
                                  showMaterialModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return ModalWindow();
                                      });
                                },
                                child: const Text(
                                  "Изменить",
                                  style:
                                      TextStyle(color: appColor, fontSize: 17),
                                )),
                          )
                        ],
                      ),
                      Text(
                        user.currentUser!.email,
                        style: const TextStyle(
                            color: appTextHeading, fontSize: 17),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                ListTile(
                  onTap: () {
                    context.router.push(MyOrdersRoute());
                  },
                  leading: const Icon(
                    Icons.menu_book,
                    color: appTextHeading,
                  ),
                  title: Text("Мои заказы"),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    context.router.push(ManageAddressRoute());
                  },
                  leading: Icon(
                    Icons.home,
                    color: appTextHeading,
                  ),
                  title: Text("Адрес доставки"),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    context.router.push(PaymentRoute(infoCart: ""));
                  },
                  leading: Icon(
                    Icons.payment,
                    color: appTextHeading,
                  ),
                  title: Text("Оплата"),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.favorite_border,
                    color: appTextHeading,
                  ),
                  title: Text("Избранное"),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.help,
                    color: appTextHeading,
                  ),
                  title: Text("Поддержка"),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    context.read<AuthProvider>().logout(context);
                  },
                  leading: Icon(
                    Icons.logout,
                    color: appTextHeading,
                  ),
                  title: Text("Выйти"),
                ),
                const Divider(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
