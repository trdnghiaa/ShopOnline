import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopvippro_demo/pages/Home_page.dart';
import 'package:shopvippro_demo/pages/Category_page.dart';
import 'package:shopvippro_demo/pages/Cart_page.dart';
import 'package:shopvippro_demo/pages/Profile_page.dart';
import 'package:shopvippro_demo/themes/colors.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  int _currentIndex = 0;
  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.category),
    Icon(Icons.shopping_cart),
    Icon(Icons.person)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LUONVUITUOI',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 10,
                color: Colors.black,
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SizedBox(
          child: Center(
            child: [
              HomePage(),
              CategoryPage(),
              CartPage(),
              ProfilePage()
            ][_currentIndex],
          ),
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              // fontSize: 12.0,
              // color: Colors.black,
              // fontSize: 15,
            ),
          )),
          child: NavigationBar(
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home', ),
              NavigationDestination(
                  icon: Icon(Icons.category), label: 'Category'),
              NavigationDestination(
                  icon: Icon(Icons.shopping_cart), label: 'Cart'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Me'),
            ],
            selectedIndex: _currentIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            backgroundColor: Colors.white,
            indicatorColor: Colors.white,
          ),
        ));
  }
}
