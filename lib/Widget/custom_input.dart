import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String content;
  final TextInputType type;
  final int maxLine;
  final String title;
  const CustomInput({
    Key? key,
    required this.title,
    required this.content,
    required this.maxLine,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      leading: SizedBox(
        width: 65,
        child: Text(title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5),
      ),
      title: TextFormField(
        initialValue: content,
        maxLines: maxLine,
        keyboardType: type,
      ),
    );
  }
}
