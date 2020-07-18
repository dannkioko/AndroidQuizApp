import 'package:flutter/material.dart';
import 'package:quizapp/models/fetchquestions.dart';
import 'package:quizapp/screens/question/questionscreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 123, 121, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Quiz App",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Container(
              color: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: FlatButton(
                onPressed: () {
                  Future<Questions> futureQuestions = fetchQuestions();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FutureBuilder(
                              future: futureQuestions,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  var questions = snapshot.data.questions;
                                  return QuestionScreen(questions);
                                }
                                return Scaffold(
                                  body: Center(
                                    child: Container(
                                      child: Text("generating questions"),
                                    ),
                                  ),
                                );
                              })));
                },
                child: Text("Load Quiz"),
                color: Color.fromRGBO(97, 149, 237, 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
