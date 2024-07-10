import 'package:flutter/material.dart';
import 'package:shopvippro_demo/models/product.dart';


class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}

class CartProvider with ChangeNotifier {
  List<CartItem> _cart = [];

  List<CartItem> get carts => _cart;

  double get totalPrice => _cart.fold(0, (sum, item) => sum + item.product.price * item.quantity);

  void addItem(Product product) {
    for (var item in _cart) {
      if (item.product.id == product.id) {
        item.quantity++;
        notifyListeners();
        return;
      }
    }
    _cart.add(CartItem(product: product));
    notifyListeners();
  }

  void removeItem(int productId) {
    _cart.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}