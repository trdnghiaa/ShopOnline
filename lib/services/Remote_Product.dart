import 'dart:convert';

import 'package:shopvippro_demo/models/product.dart';
import 'package:http/http.dart' as http;

class RemoteService {
static List<Product>? _cachedProduct;

Future<List<Product>?> getProduct() async {
    if (_cachedProduct != null) {
      return _cachedProduct;
    }
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      final List<dynamic> productJson = json.decode(response.body);
      _cachedProduct = productJson.map((json) => Product.fromJson(json)).toList();
      return _cachedProduct;
    } else {
      throw Exception('Failed to load products');
    }
  }
}