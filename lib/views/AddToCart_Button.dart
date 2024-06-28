import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopvippro_demo/constants/colors.dart';

class AddtoCartButton extends StatelessWidget {
  final String text;
  final String productImageUrl;
  final String productName;
  final double productPrice;
  final void Function()? onTap;

const AddtoCartButton({
    Key? key,
    required this.text,
    required this.productImageUrl,
    required this.productName,
    required this.productPrice,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
