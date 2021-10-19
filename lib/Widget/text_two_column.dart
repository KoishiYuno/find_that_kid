// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class text_two_column extends StatelessWidget {
  final String text;
  const text_two_column({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Text(text,
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.left),
      ),
    );
  }
}
