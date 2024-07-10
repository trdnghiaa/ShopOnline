import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:shopvippro_demo/models/user.dart';
import 'package:shopvippro_demo/pages/Register_page.dart';
import 'package:shopvippro_demo/services/Authentication.dart';
import 'package:shopvippro_demo/views/Register_button.dart';
import 'package:shopvippro_demo/views/Home_Fragment.dart';
import 'package:shopvippro_demo/views/Login_Button.dart';
import 'package:shopvippro_demo/widgets/login_provider.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  LoginPage({required this.onLoginSuccess});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService authService = AuthService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  static Color _selectedColor = Colors.black;
  static Color _unSelectedColor = Colors.grey;

  Color _usernameColor = _unSelectedColor;
  Color _passwordColor = _unSelectedColor;

  FocusNode _usernameTFFocusNode = FocusNode();
  FocusNode _passwordTFFocusNode = FocusNode();

  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    String username = _usernameController.text;
    String password = _passwordController.text;

    bool success = await authService.login(username, password);

    setState(() {
      _isLoading = false;
    });

    if (success) {
      context.read<LoginProvider>().login(username);
      widget.onLoginSuccess();
    } else {
      // Login failed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(tCheckLogin),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 30, 50, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "lib/assets/logo_app.png",
              height: 250,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                  border: Border.all(color: _usernameColor),
                  borderRadius: BorderRadius.circular(8)),
              child: TextField(
                controller: _usernameController,
                focusNode: _usernameTFFocusNode,
                decoration: InputDecoration(
                    labelText: tUsername, border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                  border: Border.all(color: _passwordColor),
                  borderRadius: BorderRadius.circular(8)),
              child: TextField(
                controller: _passwordController,
                focusNode: _passwordTFFocusNode,
                decoration: InputDecoration(
                    labelText: tPassword, border: InputBorder.none),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : LoginButton(text: "Login", onTap: _login),
            Expanded(child: SizedBox.shrink()),
            RegisterButton(text: "Create New Account ?", onTap: _register),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
