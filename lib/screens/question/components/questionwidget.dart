import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final answer;
  final Color color;

  QuestionWidget(this.answer, this.color);
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(color: color),
              child: Center(
                  child: Text(
                answer,
                style: TextStyle(fontSize: 20),
              ))),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
