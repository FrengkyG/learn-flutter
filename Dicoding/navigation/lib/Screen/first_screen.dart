import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation & Routing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/secondScreen');
              },
              child: const Text('Go To Second Screen'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Navigation with Data'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Return Data from Another Screen'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Replace Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
