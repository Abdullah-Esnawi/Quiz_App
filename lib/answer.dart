import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/question.dart';

class Answer extends StatelessWidget {
  String answerText;

  final Function() answerQuestion;
  Answer({Key? key, required this.answerText, required this.answerQuestion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ElevatedButton(
          onPressed: answerQuestion,
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(buttonColor)),
          child: Text(
            answerText,
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
