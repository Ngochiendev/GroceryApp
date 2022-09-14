import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceryapp/Screen/cart_screen.dart';
import 'package:groceryapp/Screen/category_screen.dart';
import 'package:groceryapp/Screen/home_screen.dart';
import 'package:groceryapp/Screen/setting_screen.dart';
import 'package:groceryapp/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, dynamic>> _page = [
    {'page': const HomeScreen(), 'title': 'Home Screen'},
    {'page': const CartScreen(), 'title': 'Cart Screen'},
    {'page': const CategoryScreen(), 'title': 'Category Screen'},
    {'page': const SettingScreen(), 'title': 'Setting Screen'},
  ];
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            _page[_selectedIndex]['title'],
          ),
        ),
      ),
      body: _page[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        unselectedItemColor: isDark ? Colors.white : Colors.black,
        selectedItemColor: isDark ? Colors.lightBlue.shade200 : Colors.black87,
        onTap: _selectedPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor:
                isDark ? Theme.of(context).cardColor : Colors.white,
            icon:
                Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1
                ? IconlyBold.category
                : IconlyLight.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 3 ? IconlyBold.setting : IconlyLight.setting),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
