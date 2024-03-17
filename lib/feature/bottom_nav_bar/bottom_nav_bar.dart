import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../main/categories/presentation/pages/categories_view.dart';
import '../main/home/presentation/pages/home_view.dart';
import '../main/settings/presentation/pages/settings.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _currentIndex = 0;
  final List<Widget> _view =[
    const HomeView(),
    const CategoriesView(),
    const HomeView(),
    const SettingsView(),
  ];

  _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _view.elementAt(_currentIndex),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.black,
          onTap: (index) => _changeTab(index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.homeOutline),
              activeIcon: Icon(MdiIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.giftOutline),
              activeIcon: Icon(MdiIcons.gift),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.shoppingOutline),
              activeIcon: Icon(MdiIcons.shopping),
              label: 'Bag',
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.accountOutline),
              activeIcon: Icon(MdiIcons.account),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}