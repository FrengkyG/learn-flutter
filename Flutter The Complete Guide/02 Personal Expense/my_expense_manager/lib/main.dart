import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AppBar')),
        body: Column(children: [
          Container(
            width: double.infinity,
            child: const Card(
              child: Text('Chart'),
              color: Colors.blue,
              elevation: 5,
            ),
          ),
          const Card(
            child: Text('List TRX'),
          ),
        ]),
      ),
    );
  }
}
