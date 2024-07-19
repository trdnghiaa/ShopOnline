import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:shopvippro_demo/constants/colors.dart';
import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import 'package:shopvippro_demo/services/Authentication.dart';

class UpdateProfilePage extends StatefulWidget {
  UpdateProfilePage({super.key});

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  static const Color _selectedColor = Colors.black;
  static const Color _unSelectedColor = Colors.grey;

  Color _passwordColor = _unSelectedColor;
  Color _emailColor = _unSelectedColor;
  Color _phoneColor = _unSelectedColor;

  final FocusNode _passwordTFFocusNode = FocusNode();
  final FocusNode _emailTFFocusNode = FocusNode();
  final FocusNode _phoneTFFocusNode = FocusNode();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _setupFocusNodes();
  }

  void _setupFocusNodes() {
    _passwordTFFocusNode.addListener(() {
      setState(() {
        _passwordColor =
            _passwordTFFocusNode.hasFocus ? _selectedColor : _unSelectedColor;
      });
    });
    _emailTFFocusNode.addListener(() {
      setState(() {
        _emailColor =
            _emailTFFocusNode.hasFocus ? _selectedColor : _unSelectedColor;
      });
    });
    _phoneTFFocusNode.addListener(() {
      setState(() {
        _phoneColor =
            _phoneTFFocusNode.hasFocus ? _selectedColor : _unSelectedColor;
      });
    });
  }

  @override
  void dispose() {
    _passwordTFFocusNode.dispose();
    _emailTFFocusNode.dispose();
    _phoneTFFocusNode.dispose();

    _passwordController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _updateProfile() async {
  
  final String password = _passwordController.text;
  final String email = _emailController.text;
  final String phone = _phoneController.text;

  if (password.isEmpty || email.isEmpty || phone.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(tFillFields),
      backgroundColor: Colors.red,
    ));
    return;
  }

  final Map<String, dynamic> updatedData = {
    'userId': await storage.read(key: 'userId'),
    'password': password,
    'email': email,
    'phone': phone,
  };

  try {
    await AuthService().updateUserProfile(updatedData);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(tUpdateSuccess),
      backgroundColor: Colors.green,
    ));
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Cập nhật không thành công: $e'),
      backgroundColor: Colors.red,
    ));
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            tEditProfile,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(22.0),
          child: Column(children: [
            Stack(children: [
              SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset("lib/assets/avatar.png"),
                  )),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: primaryColor,
                    ),
                    child: const Icon(
                      LineAwesomeIcons.camera,
                      size: 20.0,
                      color: Colors.white,
                    ),
                  ))
            ]),
            const SizedBox(
              height: 50,
            ),
            Form(
                child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                _buildTextField(
                  controller: _passwordController,
                  focusNode: _passwordTFFocusNode,
                  label: tPassword,
                  icon: LineAwesomeIcons.key,
                  borderColor: _passwordColor,
                ),
                const SizedBox(
                  height: 12,
                ),
                _buildTextField(
                  controller: _emailController,
                  focusNode: _emailTFFocusNode,
                  label: tEmail,
                  icon: LineAwesomeIcons.envelope,
                  borderColor: _emailColor,
                ),
                const SizedBox(
                  height: 12,
                ),
                _buildTextField(
                  controller: _phoneController,
                  focusNode: _phoneTFFocusNode,
                  label: tPhoneNum,
                  icon: LineAwesomeIcons.phone,
                  borderColor: _phoneColor,
                ),
              ],
            )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: ElevatedButton(
                  onPressed: _updateProfile,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                    tEditProfile,
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ]),
        )));
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required IconData icon,
    required Color borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8)),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
            icon: Icon(icon),
            labelText: label,
            labelStyle: const TextStyle(color: Colors.black),
            border: InputBorder.none),
      ),
    );
  }
}
