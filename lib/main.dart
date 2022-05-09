import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';
import 'package:quiz_app/themeApp.dart';

void main() {
  runApp(MyApp());
}

Color background = Colors.black;
Color textColor = Colors.white;
Color buttonColor = Colors.blueGrey;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Q1. Who created Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': -2},
        {'text': 'Adobe', 'score': -2},
        {'text': 'Google', 'score': 10},
        {'text': 'Microsoft', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. What is Flutter?',
      'answers': [
        {'text': 'Android Development Kit', 'score': -2},
        {'text': 'IOS Development Kit', 'score': -2},
        {'text': 'Web Development Kit', 'score': -2},
        {
          'text':
              'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
          'score': 10
        },
      ],
    },
    {
      'questionText': ' Q3. Which programing language is used by Flutter',
      'answers': [
        {'text': 'Ruby', 'score': -2},
        {'text': 'Dart', 'score': 10},
        {'text': 'C++', 'score': -2},
        {'text': 'Kotlin', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. Who created Dart programing language?',
      'answers': [
        {'text': 'Lars Bak and Kasper Lund', 'score': 10},
        {'text': 'Brendan Eich', 'score': -2},
        {'text': 'Bjarne Stroustrup', 'score': -2},
        {'text': 'Jeremy Ashkenas', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q5. Is Flutter for Web and Desktop available in stable version?',
      'answers': [
        {
          'text': 'Yes',
          'score': -2,
        },
        {'text': 'No', 'score': 10},
      ],
    },
  ];
  int _totalScore = 0;
  int _questionIndex = 0;
  void answerQuestion(int score) {
    setState(() {
      _questionIndex += 1;
      _totalScore += score;
      print(_totalScore);
    });
  }

  resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.system,
      // theme: ThemeClass.lightTheme,
      // darkTheme: ThemeClass.darkTheme,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: background,
            title: Text(
              'Quiz App',
              style: TextStyle(color: textColor),
            ),
            // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            actions: [
              Switch(
                  value: isSwitch,
                  onChanged: (v) {
                    setState(() {
                      isSwitch = v;
                      if (isSwitch) {
                        background = Colors.white;
                        textColor = Color(0xFF2E2E2E);
                        buttonColor = Colors.blueAccent;
                      } else {
                        background = Color(0xFF2E2E2E);
                        textColor = Colors.white;
                        buttonColor = Colors.blueGrey;
                      }
                    });
                  })
            ],
          ),
          body: Container(
            color: background,
            child: _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions)
                : Result(
                    reset: resetQuiz,
                    totalScore: _totalScore,
                  ),
          )),
    );
  }
}