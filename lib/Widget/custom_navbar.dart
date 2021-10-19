// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                tooltip: 'Kid Tracker',
                icon: Icon(Icons.map),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              IconButton(
                tooltip: 'Kid Profile',
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.pushNamed(context, '/kidProfile');
                },
              ),
              IconButton(
                tooltip: 'Post Lost Notice',
                icon: Icon(Icons.location_searching),
                onPressed: () {
                  Navigator.pushNamed(context, '/kidLost');
                },
              ),
              IconButton(
                tooltip: 'View Lost Notices',
                icon: Icon(Icons.content_copy),
                onPressed: () {
                  Navigator.pushNamed(context, '/lostNoticeList');
                },
              ),
              IconButton(
                tooltip: 'Menu',
                icon: Icon(Icons.view_list),
                onPressed: () {
                  Navigator.pushNamed(context, '/menu');
                },
              )
            ],
          )),
    );
  }
}
