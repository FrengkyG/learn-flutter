import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final VoidCallback answerQuestion;

  const Quiz(
      {Key? key,
      required this.questions,
      required this.questionIndex,
      required this.answerQuestion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
            questionText: questions[questionIndex]['questionText'].toString()),
        ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(selectHandler: answerQuestion, answer: answer);
        }).toList(),
      ],
    );
  }
}
