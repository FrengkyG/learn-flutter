import 'package:flutter/material.dart';
import 'package:flutter_assignment/text_control.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First Assignment'),
        ),
        body: const TextControl(),
      ),
    );
  }
}
