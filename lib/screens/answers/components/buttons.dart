import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  int questionNumber;
  final callback;

  Buttons(this.callback);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              callback(false);
            },
            child: Text("   Previous "),
            color: Colors.amber,
          ),
          FlatButton(
            onPressed: () {
              callback(true);
            },
            child: Text("Next"),
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
