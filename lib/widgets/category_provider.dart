import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shopvippro_demo/models/product.dart';

class CategoryProvider with ChangeNotifier {
  List<Product> _categories = [];
  List<Product> _filteredCategories = [];
  bool _isLoading = false;

  List<Product> get categories => _filteredCategories;
  bool get isLoading => _isLoading;

  void filterCategories(String query) {
    if (query.isEmpty) {
      _filteredCategories = _categories;
    } else {
      _filteredCategories = _categories
          .where((category) =>
              category.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();

    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final List<dynamic> categoryJson = json.decode(response.body);
      _categories = categoryJson.map((json) => Product.fromJson(json)).toList();
      _filteredCategories = _categories;
      _isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
