import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  const Answer({Key? key, required this.selectHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.cyan),
        ),
        child: const Text('Answer1'),
        onPressed: selectHandler,
      ),
    );
  }
}
