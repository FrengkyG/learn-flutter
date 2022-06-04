import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback resetHandler;
  const Result({Key? key, required this.score, required this.resetHandler})
      : super(key: key);

  String get resultPhrase {
    String resultText;
    if (score <= 10) {
      resultText = 'You are Awesome and innocent';
    } else if (score <= 20) {
      resultText = 'Pretty likeable';
    } else if (score <= 30) {
      resultText = 'You are ... Strange ?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          MaterialButton(
              child: const Text(
                'Reset Quiz',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: resetHandler),
        ],
      ),
    );
  }
}
