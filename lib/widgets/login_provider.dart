import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _username = '';

  bool get isLoggedIn => _isLoggedIn;
  String get username => _username;

  void login(String username) {
    // Thực hiện hành động đăng nhập
    _isLoggedIn = true;
    _username = username;

    notifyListeners();
  }

  void logout() {
    // Thực hiện hành động đăng xuất
    _isLoggedIn = false;
    _username = '';

    notifyListeners();
  }
}
