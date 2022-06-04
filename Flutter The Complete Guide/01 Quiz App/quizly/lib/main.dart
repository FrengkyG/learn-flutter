import 'package:flutter/material.dart';
import 'package:quizly/answer.dart';
import 'package:quizly/question.dart';
import 'package:quizly/quiz.dart';
import 'package:quizly/result.dart';

void main() {
  runApp(const MyApp());
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
    const _questions = [
      {
        'questionText': 'What\'s Your Favorite Colour',
        'answers': ['Black', 'Red', 'Green', 'Blue'],
      },
      {
        'questionText': 'What\'s Your Favorite Animal',
        'answers': ['Dog', 'Cat', 'Rabbit', 'Hamster'],
      },
      {
        'questionText': 'What\'s Your Favorite Instructor',
        'answers': ['Frengky', 'Gunawan', 'Sky', 'Blue'],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quizly'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : const Result(),
      ),
    );
  }
}
