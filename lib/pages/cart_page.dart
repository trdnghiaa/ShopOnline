import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';
import 'package:shopvippro_demo/constants/colors.dart';
import 'package:shopvippro_demo/constants/text_strings.dart';
import 'package:shopvippro_demo/profile/widget/cart_provider.dart';
import 'package:shopvippro_demo/models/post.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        'Giỏ hàng',
        textAlign: TextAlign.center,
      ),
    );
  }
}
