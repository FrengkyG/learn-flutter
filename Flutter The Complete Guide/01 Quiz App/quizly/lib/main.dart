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
        body: Column(
          children: [
            Question(
                questionText:
                    questions[_questionIndex]['questionText'].toString()),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(selectHandler: _answerQuestion, answer: answer);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
