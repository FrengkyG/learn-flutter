import 'package:flutter/material.dart';
import 'package:flutter_assignment/text_output.dart';

class TextControl extends StatefulWidget {
  const TextControl({Key? key}) : super(key: key);

  @override
  State<TextControl> createState() => _TextControlState();
}

class _TextControlState extends State<TextControl> {
  String _mainText = 'My First Word';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextOutput(mainText: _mainText),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _mainText = 'My text got changed';
            });
          },
          child: const Text('Change text'),
        ),
      ],
    );
  }
}
