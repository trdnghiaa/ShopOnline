import 'package:flutter/material.dart';
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
                Image(image: AssetImage("lib/assets/logo_app.png"), height: 200,),
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
                SizedBox(
                  width: 100,
                  height: 50,
                  child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Expanded(child: SizedBox.shrink()),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewAccCount()));
                  },
                  child: Text('Create New Account ?', style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.blue
                  ),
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
