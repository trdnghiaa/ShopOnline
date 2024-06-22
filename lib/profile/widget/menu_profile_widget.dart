import 'package:flutter/material.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.blue.withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: Colors.blue,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.apply(color: textColor),
        ),
        trailing: endIcon
            ? Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Icon(
                  LineAwesomeIcons.angle_right,
                  size: 18.0,
                  color: Colors.grey,
                ),
              )
            : null);
  }
}
