import 'package:flutter/material.dart';
import 'package:quizly/answer.dart';
import 'package:quizly/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;

  _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s Your Favorite Colour?',
      'What\'s Your Favorite Animal?'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quizly'),
        ),
        body: Column(
          children: [
            Question(questionText: questions[_questionIndex]),
            Answer(selectHandler: _answerQuestion),
            Answer(selectHandler: _answerQuestion),
            Answer(selectHandler: _answerQuestion),
          ],
        ),
      ),
    );
  }
}
