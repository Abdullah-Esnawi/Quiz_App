import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/answer.dart';

class Quiz extends StatelessWidget {
  List questions;
  int questionIndex;
  final Function(int s) answerQuestion;

  Quiz(
      {Key? key,
      required this.answerQuestion,
      required this.questionIndex,
      required this.questions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Question(
                questionText:
                    questions[questionIndex]['questionText'] as String),
            ...(questions[questionIndex]['answers']
                    as List<Map<String, Object>>)
                .map((answer) {
              return Answer(
                  answerText: answer['text'].toString(),
                  answerQuestion: () => answerQuestion(answer['score'] as int));
            })
          ],
        ));
  }
}
