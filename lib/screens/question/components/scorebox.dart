import 'package:flutter/material.dart';

class ScoreBox extends StatelessWidget {
  final int questionNumber;
  final int correct, outOf;
  ScoreBox(this.questionNumber, this.correct, this.outOf);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 123, 121, 10),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      height: 100,
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
                      color: Colors.amber,
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
    );
  }
}
