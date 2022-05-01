import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/screens/login_screen.dart';
import 'package:food_app/screens/main_screens/cart_screen.dart';
import 'package:food_app/screens/main_screens/explore_screen.dart';
import 'package:food_app/screens/main_screens/offers_screen.dart';
import 'package:food_app/screens/main_screens/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      navBarHeight: 60,
      screens: const [
        ExploreScreen(),
        OffersScreen(),
        CartScreen(),
        ProfileScreen(),
      ],
      items: [
        PersistentBottomNavBarItem(
          contentPadding: 0,
          iconSize: 30,
          textStyle: const TextStyle(fontSize: 15),
          icon: const Icon(
            Icons.explore,
          ),
          title: ("Explore"),
          inactiveColorPrimary: Colors.black,
          activeColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          contentPadding: 0,
          iconSize: 30,
          textStyle: const TextStyle(fontSize: 15),
          icon: const Icon(
            Icons.local_offer_sharp,
          ),
          title: ("Offers"),
          inactiveColorPrimary: Colors.black,
          activeColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          contentPadding: 0,
          iconSize: 30,
          textStyle: const TextStyle(fontSize: 15),
          icon: const Icon(
            Icons.shopping_bag,
          ),
          title: ("Cart"),
          inactiveColorPrimary: Colors.black,
          activeColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          textStyle: const TextStyle(fontSize: 15),
          contentPadding: 0,
          iconSize: 30,
          icon: const Icon(
            Icons.account_circle,
          ),
          title: ("Profile"),
          inactiveColorPrimary: Colors.black,
          activeColorPrimary: Colors.white,
        ),
      ],
      confineInSafeArea: true,
      backgroundColor: appColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.once,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
    );
  }
}
