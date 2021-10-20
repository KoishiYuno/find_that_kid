// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:find_that_kid/Widget/widget.dart';
import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  static const String routeName = '/menu';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => MenuView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Menu',
        leading: false,
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
