import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopvippro_demo/pages/home_page.dart';
import 'package:shopvippro_demo/pages/category_page.dart';
import 'package:shopvippro_demo/pages/cart_page.dart';
import 'package:shopvippro_demo/pages/profile_page.dart';


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
          title: const Text('SHEIN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                letterSpacing: 10,
              )),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: [HomePage(),CategoryPage(),CartPage(),ProfilePage()][_currentIndex],
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              // fontSize: 12.0,
              color: Colors.white,
            ),
          )),
          child: NavigationBar(
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Trang chủ'),
              NavigationDestination(
                  icon: Icon(Icons.category), label: 'Danh mục'),
              NavigationDestination(
                  icon: Icon(Icons.shopping_cart), label: 'Giỏ  hàng'),
              NavigationDestination(
                  icon: Icon(Icons.person), label: 'Thông tin'),
            ],
            selectedIndex: _currentIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            backgroundColor: Colors.black,
          ),
        ));
  }
}
