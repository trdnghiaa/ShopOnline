import 'package:flutter/material.dart';
import 'package:shopvippro_demo/views/Search_Bar.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return SearchBarApp();
  }
}
