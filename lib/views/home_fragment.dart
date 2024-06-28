import 'package:flutter/material.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:shopvippro_demo/pages/Category_page.dart';
import 'package:shopvippro_demo/models/product.dart';
import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:shopvippro_demo/pages/Home/Home_page.dart';
import 'package:shopvippro_demo/pages/Cart_page.dart';
import 'package:shopvippro_demo/pages/Login_page.dart';
import 'package:shopvippro_demo/constants/colors.dart';
import 'package:shopvippro_demo/pages/profile/Profile_page.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  int _currentIndex = 0;

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
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
            letterSpacing: 10,
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
      body: Center(
        child: pages[_currentIndex],
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
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(LineAwesomeIcons.list_alt),
              label: 'Category',
            ),
            NavigationDestination(
              icon: Icon(LineAwesomeIcons.cart_arrow_down),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(LineAwesomeIcons.user),
              label: 'Profile',
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
      ),
    );
  }
}
