import 'package:flutter/material.dart';
import 'package:shopvippro_demo/models/post.dart';


class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.product.price * item.quantity);

  void addItem(Product product) {
    for (var item in _items) {
      if (item.product.id == product.id) {
        item.quantity++;
        notifyListeners();
        return;
      }
    }
    _items.add(CartItem(product: product));
    notifyListeners();
  }

  void removeItem(int productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
