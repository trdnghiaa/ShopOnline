import 'package:flutter/material.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:provider/provider.dart';

import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:shopvippro_demo/pages/Favorites_page.dart';
import 'package:shopvippro_demo/pages/Login_page.dart';
import 'package:shopvippro_demo/pages/profile/Update_Profile_page.dart';
import 'package:shopvippro_demo/widgets/login_provider.dart';
import 'package:shopvippro_demo/widgets/menu_profile_widget.dart';
import 'package:shopvippro_demo/constants/colors.dart';
import 'package:shopvippro_demo/views/Home_Fragment.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset("lib/assets/avatar.png"))),
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
                      child: Icon(
                        LineAwesomeIcons.pencil,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Consumer<LoginProvider>(builder: (context, loginProvider, child) {
                return Text(
                  loginProvider.isLoggedIn
                      ? 'Hello, ${loginProvider.username}'
                      : '',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateProfilePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: const Text(
                      tEditProfile,
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 15,
              ),
              ProfileMenuWidget(
                title: tMenuProfile1,
                icon: LineAwesomeIcons.cogs,
                onTap: () {},
              ),
              ProfileMenuWidget(
                title: tMenuProfile2,
                icon: LineAwesomeIcons.heart_o,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoritesPage(),
                    ),
                  );
                },
              ),
              const Divider(),
              ProfileMenuWidget(
                title: tMenuProfile3,
                icon: LineAwesomeIcons.info_circle,
                onTap: () {},
              ),
              ProfileMenuWidget(
                title: tMenuProfile4,
                icon: LineAwesomeIcons.sign_out,
                textColor: Colors.red,
                endIcon: false,
                onTap: () {
                  context.read<LoginProvider>().logout();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(
                        onLoginSuccess: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeFragment(),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
