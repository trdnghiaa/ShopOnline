// lib/pages/register_page.dart
import 'package:flutter/material.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:shopvippro_demo/models/user.dart';
import 'package:shopvippro_demo/services/Authentication.dart';
import 'package:shopvippro_demo/views/Register_button.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final AuthService _authService = AuthService();

  static Color _selectedColor = Colors.black;
  static Color _unSelectedColor = Colors.grey;

  Color _usernameColor = _unSelectedColor;
  Color _passwordColor = _unSelectedColor;
  Color _emailwordColor = _unSelectedColor;
  Color _phoneColor = _unSelectedColor;

  FocusNode _usernameTFFocusNode = FocusNode();
  FocusNode _passwordTFFocusNode = FocusNode();
  FocusNode _emailTFFocusNode = FocusNode();
  FocusNode _phoneTFFocusNode = FocusNode();

  void _register() async {
    if (_formKey.currentState!.validate()) {
      User user = User(
        username: _usernameController.text,
        password: _passwordController.text,
        email: _emailController.text,
        phone: _phoneController.text,
      );

      bool isRegistered = await _authService.register(user);

      if (isRegistered) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User registered successfully')),
        );
        // Chuyển hướng đến trang đăng nhập hoặc trang chính
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to register user')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(tCreateNewAccount),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage("lib/assets/logo_app.png"),
                fit: BoxFit.fill,
                height: 250,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                    border: Border.all(color: _usernameColor),
                    borderRadius: BorderRadius.circular(8)),
                child: TextFormField(
                  controller: _usernameController,
                  focusNode: _usernameTFFocusNode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      icon: Icon(LineAwesomeIcons.user),
                      labelText: tUsername,
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                    border: Border.all(color: _passwordColor),
                    borderRadius: BorderRadius.circular(8)),
                child: TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordTFFocusNode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(LineAwesomeIcons.key),
                    labelText: tPassword,
                    border: InputBorder.none,
                  ),
                  obscureText: true
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                    border: Border.all(color: _emailwordColor),
                    borderRadius: BorderRadius.circular(8)),
                child: TextFormField(
                  controller: _emailController,
                  focusNode: _emailTFFocusNode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(LineAwesomeIcons.envelope),
                    labelText: tEmail,
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                    border: Border.all(color: _phoneColor),
                    borderRadius: BorderRadius.circular(8)),
                child: TextFormField(
                  controller: _phoneController,
                  focusNode: _phoneTFFocusNode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(LineAwesomeIcons.phone),
                    labelText: tPhoneNum,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              RegisterButton(
                onTap: () => _register(),
                text: "Đăng Ký",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
