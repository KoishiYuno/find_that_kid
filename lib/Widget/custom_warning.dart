// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';

class customWarningText extends StatelessWidget {
  final String text;
  final Color text_color;
  final Color background_color;

  const customWarningText({
    Key? key,
    required this.text,
    required this.text_color,
    required this.background_color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, bottom: 20, right: 30),
      child: TextField(
        enabled: false,
        readOnly: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          filled: true,
          fillColor: background_color,
          hintText: text,
          hintStyle: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: text_color),
        ),
        // contentPadding:
        //     const EdgeInsets.only(left: 20, bottom: 5, right: 5)
      ),
    );
  }
}
