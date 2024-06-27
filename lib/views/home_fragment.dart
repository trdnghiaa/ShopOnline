import 'package:flutter/material.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';

import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:shopvippro_demo/pages/Home_page.dart';
import 'package:shopvippro_demo/pages/Category_page.dart';
import 'package:shopvippro_demo/pages/Cart_page.dart';
import 'package:shopvippro_demo/pages/Login_page.dart';
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
          title: const Text(tNameApp,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 10,
                color: Colors.black,
              )),
          shadowColor: Colors.black,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                color: Colors.black,
                height: 0.5,
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
              LoginPage()
            ][_currentIndex],
          ),
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          )),
          child: NavigationBar(
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  LineAwesomeIcons.home,
                  size: 25,
                ),
                label: tMenuBottom1,
              ),
              NavigationDestination(
                  icon: Icon(LineAwesomeIcons.tasks, size: 25),
                  label: tMenuBottom2),
              NavigationDestination(
                  icon: Icon(LineAwesomeIcons.shopping_cart, size: 25),
                  label: tMenuBottom3),
              NavigationDestination(
                  icon: Icon(LineAwesomeIcons.user, size: 25),
                  label: tMenuBottom4),
            ],
            selectedIndex: _currentIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            indicatorColor: indicatorBottom,
          ),
        ));
  }
}
