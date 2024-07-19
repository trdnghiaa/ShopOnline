import 'package:flutter/material.dart';
import 'package:shopvippro_demo/constants/colors.dart';


class LoginButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const LoginButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorApp,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.fromLTRB(95, 10, 95, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}