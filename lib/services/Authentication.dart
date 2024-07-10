import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shopvippro_demo/models/user.dart';

class AuthService {
  final String baseUrl = dotenv.env['BE_BASE_URL']!;
  final storage = const FlutterSecureStorage();

  Future<bool> register(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      print('Failed to register: ${response.body}');
      return false;
    }
  }

  Future<bool> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];

      await storage.write(key: 'token', value: token);
      return true;
    } else {
      print('Failed to login: ${response.body}');
      return false;
    }
  }

  Future<void> updateUserProfile(Map<String, dynamic> updatedData) async {
    final token = await storage.read(key: 'token');
    final response = await http.put(
      Uri.parse('$baseUrl/update'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(updatedData),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final newToken = data['token'];
      await storage.write(key: 'token', value: newToken);

      print('Profile updated successfully');
    } else {
      print('Failed to update profile: ${response.body}');
    }
  }
}
