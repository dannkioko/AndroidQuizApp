import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Center(child: Text("Question number"))),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
