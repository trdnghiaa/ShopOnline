// lib/services/auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopvippro_demo/models/user.dart';
// 10.21.16.208

class AuthService {
  final String baseUrl = 'http://192.168.1.214:3000/api/auth';

  // Đăng ký người dùng
  Future<bool> register(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  // Đăng nhập người dùng
  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
