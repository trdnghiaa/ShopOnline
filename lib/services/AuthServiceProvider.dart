import 'package:flutter/material.dart';

class AuthServiceProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    // Thực hiện hành động đăng nhập
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    // Thực hiện hành động đăng xuất
    _isLoggedIn = false;
    notifyListeners();
  }
}
