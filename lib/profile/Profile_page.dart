import 'package:flutter/material.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';

import 'package:shopvippro_demo/Profile/Update_Profile_page.dart';
import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:shopvippro_demo/pages/Login_page.dart';
import 'package:shopvippro_demo/profile/widget/menu_profile_widget.dart';
import 'package:shopvippro_demo/themes/colors.dart';
import 'package:shopvippro_demo/views/Home_Fragment.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tProfile),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
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
                      child: Icon(
                        LineAwesomeIcons.pencil,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Text(tUsername, style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(tEmail, style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  UpdateProfilePage()),
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
              //Menu
              ProfileMenuWidget(
                title: tMenuProfile1,
                icon: LineAwesomeIcons.cogs,
                onTap: () {},
              ),
              ProfileMenuWidget(
                title: tMenuProfile2,
                icon: LineAwesomeIcons.credit_card,
                onTap: () {},
              ),
              const Divider(
                color: Colors.grey,
              ),
              // const Divider(
              //   height: 50,
              // ),
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
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
