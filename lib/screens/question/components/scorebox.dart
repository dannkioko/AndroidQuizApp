import 'package:flutter/material.dart';

class ScoreBox extends StatelessWidget {
  final int questionNumber;
  final int correct, outOf;
  ScoreBox(this.questionNumber, this.correct, this.outOf);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 100,
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Question : $questionNumber",
                  style: TextStyle(
                    fontSize: 25,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "$correct",
                    style: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "/",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                  Text(
                    "$outOf",
                    style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
