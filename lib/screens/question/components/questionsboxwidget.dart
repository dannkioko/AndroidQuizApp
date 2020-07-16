import 'package:flutter/material.dart';
import 'package:quizapp/screens/question/components/questionwidget.dart';

class QuestionBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(4, (index) => QuestionWidget())),
    );
  }
}
