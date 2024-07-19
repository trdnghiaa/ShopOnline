import 'package:flutter/material.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:shopvippro_demo/screen/CateScreen.dart';
import 'package:shopvippro_demo/models/product.dart';
import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:shopvippro_demo/screen/Home/HomeScreen.dart';
import 'package:shopvippro_demo/screen/CartScreen.dart';
import 'package:shopvippro_demo/screen/LoginScreen.dart';
import 'package:shopvippro_demo/constants/colors.dart';
import 'package:shopvippro_demo/screen/profile/Profile_page.dart';

class HomeFragment extends StatefulWidget {
  final int index;

  HomeFragment({this.index = 0});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  late int _currentIndex;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    pages = [
      HomePage(),
      CategoryPage(selectedCategory: Category.ELECTRONICS),
      CartPage(),
      LoginPage(
        onLoginSuccess: () {
          setState(() {
            pages[3] = ProfilePage(); // Replace LoginPage with ProfilePage
            _currentIndex = 3; // Navigate to ProfilePage after successful login
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
          style: TextStyle(
            letterSpacing: 8,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 60.2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
        ),
        elevation: 0.00,
        backgroundColor: colorApp,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
        child: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(LineAwesomeIcons.home),
              label: tMenuBottom1,
            ),
            NavigationDestination(
              icon: Icon(LineAwesomeIcons.list_alt),
              label: tMenuBottom2,
            ),
            NavigationDestination(
              icon: Icon(LineAwesomeIcons.cart_arrow_down),
              label: tMenuBottom3,
            ),
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
          indicatorColor: btnAddToCart,
          backgroundColor: colorApp,
        ),
      ),
    );
  }
}
