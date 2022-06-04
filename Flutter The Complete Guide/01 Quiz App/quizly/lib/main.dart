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
  int _totalScore = 0;

  _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        'questionText': 'What\'s Your Favorite Colour',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 8},
          {'text': 'Green', 'score': 6},
          {'text': 'Blue', 'score': 4},
        ],
      },
      {
        'questionText': 'What\'s Your Favorite Animal',
        'answers': [
          {'text': 'Dog', 'score': 6},
          {'text': 'Cat', 'score': 10},
          {'text': 'Rabbit', 'score': 4},
          {'text': 'Hamster', 'score': 2},
        ],
      },
      {
        'questionText': 'What\'s Your Favorite Instructor',
        'answers': [
          {'text': 'Frengky', 'score': 4},
          {'text': 'Gunawan', 'score': 6},
          {'text': 'Sky', 'score': 10},
          {'text': 'Blue', 'score': 8},
        ],
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
            : Result(score: _totalScore, resetHandler: _resetQuiz),
      ),
    );
  }
}
