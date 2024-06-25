import 'package:flutter/material.dart';
import 'package:shopvippro_demo/models/product.dart';
import 'package:shopvippro_demo/services/Remote_Product.dart';
import 'package:shopvippro_demo/views/Search_Bar.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
//api post
  List<Product>? product;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    //fetch data from API
    getData();
  }

  getData() async {
    product = await RemoteService().getProduct();
    if (!mounted) return;
    if (product != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
  return SearchBarApp();
}
}
