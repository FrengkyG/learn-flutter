import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget {
  final String mainText;
  const TextOutput({Key? key, required this.mainText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(mainText);
  }
}
