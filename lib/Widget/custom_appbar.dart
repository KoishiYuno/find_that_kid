// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool leading;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      automaticallyImplyLeading: leading,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline2!
            .copyWith(color: Colors.white),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
