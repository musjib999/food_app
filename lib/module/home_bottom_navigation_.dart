import 'package:flutter/material.dart';
import 'package:food_app/module/screens/screens.dart';
import 'package:food_app/shared/themes/colors.dart';
import 'package:ionicons/ionicons.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

class HomeBottomNavigation extends StatefulWidget {
  const HomeBottomNavigation({Key? key}) : super(key: key);

  @override
  _HomeBottomNavigationState createState() => _HomeBottomNavigationState();
}

class _HomeBottomNavigationState extends State<HomeBottomNavigation> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pages.elementAt(_selectedIndex),
      ),
      backgroundColor: AppColors.bgColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //New
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 0
                ? FluentSystemIcons.ic_fluent_home_filled
                : FluentSystemIcons.ic_fluent_home_regular),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1
                ? Ionicons.compass
                : Ionicons.compass_outline),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 2 ? Ionicons.cart : Ionicons.cart_outline,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 3
                ? FluentSystemIcons.ic_fluent_heart_filled
                : FluentSystemIcons.ic_fluent_heart_regular),
            label: 'Favourites',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
