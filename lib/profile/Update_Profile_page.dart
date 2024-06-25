import 'package:flutter/material.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:shopvippro_demo/profile/Profile_page.dart';
import 'package:shopvippro_demo/themes/colors.dart';

class UpdateProfilePage extends StatelessWidget {
  UpdateProfilePage({super.key});

  static Color _selectedColor = Colors.black;
  static Color _unSelectedColor = Colors.grey;

  Color _usernameColor = _unSelectedColor;
  Color _passwordColor = _unSelectedColor;
  Color _emailColor = _unSelectedColor;
  Color _phoneColor = _unSelectedColor;

  FocusNode _usernameTFFocusNode = FocusNode();
  FocusNode _passwordTFFocusNode = FocusNode();
  FocusNode _emailTFFocusNode = FocusNode();
  FocusNode _phoneTFFocusNode = FocusNode();

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
                    child: Image.network(
                        'https://scontent.fsgn2-7.fna.fbcdn.net/v/t39.30808-1/312306876_1456430858100790_1814465686343165423_n.jpg?stp=cp6_dst-jpg_p200x200&_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_ohc=mD--9SZcuIsQ7kNvgGYCG3P&_nc_ht=scontent.fsgn2-7.fna&oh=00_AYDoVDeth155n6fI-A0uXYOhFChWIT0PjDIqiDhoTk_Ixg&oe=667B3CC8'),
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                      border: Border.all(color: _usernameColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextField(
                    focusNode: _usernameTFFocusNode,
                    decoration: InputDecoration(
                        icon: Icon(LineAwesomeIcons.user),
                        labelText: tUsername,
                        labelStyle: TextStyle(color: Colors.black),
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
                        icon: Icon(LineAwesomeIcons.key),
                        labelText: tPassword,
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                      border: Border.all(color: _emailColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextField(
                    focusNode: _emailTFFocusNode,
                    decoration: InputDecoration(
                        icon: Icon(LineAwesomeIcons.envelope),
                        labelText: tEmail,
                        labelStyle: TextStyle(color: Colors.black),
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
                      border: Border.all(color: _phoneColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextField(
                    focusNode: _phoneTFFocusNode,
                    decoration: InputDecoration(
                        icon: Icon(LineAwesomeIcons.phone),
                        labelText: "Phone",
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none),
                  ),
                ),
              ],
            )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ]),
        )));
  }
}
