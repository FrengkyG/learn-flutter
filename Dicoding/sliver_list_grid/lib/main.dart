import 'package:flutter/material.dart';
import 'package:sliver_list_grid/page/learning_path_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LearningPathPage(),
    );
  }
}
