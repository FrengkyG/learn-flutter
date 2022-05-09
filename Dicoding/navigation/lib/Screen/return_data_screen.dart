import 'package:flutter/material.dart';

class ReturnDataScreen extends StatefulWidget {
  const ReturnDataScreen({Key? key}) : super(key: key);

  @override
  State<ReturnDataScreen> createState() => _ReturnDataScreenState();
}

class _ReturnDataScreenState extends State<ReturnDataScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(labelText: 'Enter your Name'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _textController.text);
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
