import 'package:flutter/material.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';

import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:shopvippro_demo/pages/Home/Home_page.dart';
import 'package:shopvippro_demo/pages/Category_page.dart';
import 'package:shopvippro_demo/pages/Cart_page.dart';
import 'package:shopvippro_demo/pages/Login_page.dart';
import 'package:shopvippro_demo/constants/colors.dart';
import 'package:shopvippro_demo/profile/Profile_page.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  int _currentIndex = 0;

  List<Widget> pages = [];

  void initState() {
    super.initState();
    pages = [
      HomePage(),
      CategoryPage(),
      CartPage(),
      LoginPage(
        onLoginSuccess: () {
          setState(() {
            pages[3] = ProfilePage(); // Thay thế LoginPage bằng ProfilePage
            _currentIndex =
                3; // Chuyển đến ProfilePage sau khi đăng nhập thành công
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            tNameApp,
            style: TextStyle(letterSpacing: 10, fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          centerTitle: true,
          toolbarHeight: 60.2,
          // toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50)),
          ),
          elevation: 0.00,
          backgroundColor: colorApp,
        ),
        body: SizedBox(
          child: Center(
            child: pages[_currentIndex],
          ),
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          )),
          child: NavigationBar(
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  LineAwesomeIcons.home,
                ),
                label: tMenuBottom1,
              ),
              NavigationDestination(
                icon: Icon(LineAwesomeIcons.tasks),
                label: tMenuBottom2,
              ),
              NavigationDestination(
                  icon: Icon(LineAwesomeIcons.shopping_cart),
                  label: tMenuBottom3),
              NavigationDestination(
                icon: Icon(LineAwesomeIcons.user),
                label: tMenuBottom4,
              ),
            ],
            selectedIndex: _currentIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            indicatorColor: Colors.white,
            backgroundColor: colorApp,
          ),
        ));
  }
}
