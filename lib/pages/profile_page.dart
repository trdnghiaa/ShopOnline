import 'package:flutter/material.dart';
import 'package:shopvippro_demo/views/CreateNewAccount_button.dart';
import 'package:shopvippro_demo/views/Login_Button.dart';
import 'Create.Newaccount_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static Color _selectedColor = Colors.black;
  static Color _unSelectedColor = Colors.grey;

  Color _emailTFColor = _unSelectedColor;
  Color _passwordColor = _unSelectedColor;

  FocusNode _emailTFFocusNode = FocusNode();
  FocusNode _passwordTFFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTFFocusNode.addListener(_onEmailTFFocusChange);
    _passwordTFFocusNode.addListener(_onPasswordTFFocusChange);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailTFFocusNode.removeListener(_onEmailTFFocusChange);
    _emailTFFocusNode.dispose();
    _passwordTFFocusNode.removeListener(_onPasswordTFFocusChange);
    _passwordTFFocusNode.dispose();
  }

  void _onEmailTFFocusChange() {
    setState(() {
      _emailTFFocusNode.hasFocus
          ? _emailTFColor = _selectedColor
          : _emailTFColor = _unSelectedColor;
    });
  }

  void _onPasswordTFFocusChange() {
    setState(() {
      _passwordTFFocusNode.hasFocus
          ? _passwordColor = _selectedColor
          : _passwordColor = _unSelectedColor;
    });
  }

  void login() {}

  void createAccount() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NewAccCount()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 80, 20, 36),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //image
                Image(
                  image: AssetImage("lib/assets/logo_app.png"),
                  height: 200,
                ),
                //Textfield Username
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                      border: Border.all(color: _emailTFColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextField(
                    focusNode: _emailTFFocusNode,
                    decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(color: _emailTFColor),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                //Textfiled Password
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                      border: Border.all(color: _passwordColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextField(
                    focusNode: _passwordTFFocusNode,
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: _passwordColor),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(height: 20),
                //Login
                SizedBox(
                  width: 100,
                  child: LoginButton(text: "Login", onTap: login),
                ),
                Expanded(child: SizedBox.shrink()),
                //Create new account
                SizedBox(
                  width: 200,
                  child: CreateNewAccountButton(
                      text: "Create New Account ?", onTap: createAccount),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => NewAccCount()));
