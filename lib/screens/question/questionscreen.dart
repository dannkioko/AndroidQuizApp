import 'package:flutter/material.dart';
import 'package:quizapp/screens/question/components/questionsboxwidget.dart';
import 'package:quizapp/screens/question/components/scorebox.dart';
import 'package:quizapp/screens/results/resuts_screen.dart';

class QuestionScreen extends StatefulWidget {
  final questions;

  QuestionScreen(this.questions);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionNumber = 0;
  var incorrectAnswers, correctAnswer, selectedIndex;
  int correct = 0;
  int outOf = 5;
  var currentSelection = false;
  List<dynamic> answers;

  @override
  void initState() {
    selectedIndex = null;
    correctAnswer = widget.questions[questionNumber]['correct_answer'];
    incorrectAnswers = widget.questions[questionNumber]['incorrect_answers'];
    answers = List.from(incorrectAnswers);
    answers.add(correctAnswer);
    answers.shuffle();
    super.initState();
  }

  void callBack(a, b) {
    setState(() {
      if (a) {
        currentSelection = true;
      } else {
        currentSelection = false;
      }
      selectedIndex = b;
    });
  }

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text('Select an answer'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(correctAnswer);
    return Scaffold(
// #80b4ff
// #ff7b79
      appBar: AppBar(
        title: Text(
          "Quiz App",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ScoreBox(questionNumber + 1, correct, outOf),
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: questionNumber < outOf
                                ? Text(
                                    widget.questions[questionNumber]
                                        ['question'],
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),
                      QuestionBoxWidget(
                          answers, correctAnswer, callBack, selectedIndex),
                      Builder(
                        builder: (context) {
                          return FlatButton(
                              onPressed: () {
                                if (selectedIndex != null) {
                                  setState(() {
                                    if (currentSelection) {
                                      correct++;
                                    }
                                    selectedIndex = null;
                                    currentSelection = false;
                                    questionNumber++;
                                    if (questionNumber == outOf) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ResultsScreen(
                                                      correct, outOf)));
                                    } else {
                                      correctAnswer =
                                          widget.questions[questionNumber]
                                              ['correct_answer'];
                                      incorrectAnswers =
                                          widget.questions[questionNumber]
                                              ['incorrect_answers'];

                                      answers = List.from(incorrectAnswers);
                                      answers.add(correctAnswer);
                                      answers.shuffle();
                                    }
                                  });
                                } else {
                                  _showToast(context);
                                }
                              },
                              color: Colors.amber,
                              child: Text("Submit"));
                        },
                      )
                    ],
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
