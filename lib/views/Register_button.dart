import 'package:flutter/material.dart';
import 'package:shopvippro_demo/constants/colors.dart';


class RegisterButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const RegisterButton(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: colorApp,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}