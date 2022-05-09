import 'package:flutter/material.dart';

class SecondScreenWithData extends StatelessWidget {
  final String data;
  const SecondScreenWithData(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(data),
          ElevatedButton(
            child: const Text('Back'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
