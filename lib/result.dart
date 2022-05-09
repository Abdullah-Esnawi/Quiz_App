import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

class Result extends StatelessWidget {
  final Function() reset;
  int totalScore;
  Result({Key? key, required this.reset, required this.totalScore})
      : super(key: key);

  String get resultPhrase {
    String resultText;
    if (totalScore >= 41) {
      resultText = 'You are awesome!';
      print(totalScore);
    } else if (totalScore >= 31) {
      resultText = 'Pretty likeable!';
      print(totalScore);
    } else if (totalScore >= 21) {
      resultText = 'You need to work more!';
    } else if (totalScore >= 1) {
      resultText = 'You need to work hard!';
    } else {
      resultText = 'This is a poor score!';
      print(totalScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          resultPhrase,
          style: TextStyle(
              fontSize: 26, color: textColor, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Padding(padding: EdgeInsets.all(10)),
        Text(
          'Score: ' '$totalScore',
          style: TextStyle(
              fontSize: 36, color: textColor, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(width: 1.0, color: textColor),
            textStyle: TextStyle(color: textColor)
          ),

          // style: ButtonStyle(
          //     foregroundColor: MaterialStateProperty.all(textColor)),
          onPressed: reset,
          child: Text(
            'Restart The App',
            style: TextStyle(fontSize: 19),
          ),
        ),
      ]),
    );
  }
}
