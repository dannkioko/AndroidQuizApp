import 'package:flutter/material.dart';
import 'package:quizapp/screens/answers/components/answerwidget.dart';

class AnswerBox extends StatelessWidget {
  final answers, correctAnswer;
  AnswerBox(this.answers, this.correctAnswer);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                answers.length,
                (index) => answers[index] == correctAnswer
                    ? AnswerWidget(answers[index], Colors.green)
                    : AnswerWidget(answers[index], Colors.blueGrey),
              ),
            )));
  }
}
