import 'package:flutter/material.dart';
import 'package:quizapp/screens/question/components/questionsboxwidget.dart';
import 'package:quizapp/screens/question/components/scorebox.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            ScoreBox(),
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 250,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text("This is the question"),
                        ),
                        QuestionBoxWidget(),
                        Container(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FlatButton(
                                  onPressed: () {}, child: Text('Previous')),
                              FlatButton(
                                  onPressed: () {}, child: Text('Submit'))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
