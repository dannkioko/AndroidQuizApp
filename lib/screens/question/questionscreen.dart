import 'package:flutter/material.dart';
import 'package:quizapp/screens/question/components/questionsboxwidget.dart';
import 'package:quizapp/screens/question/components/scorebox.dart';

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
  int outOf = 20;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                            child: Text(
                              widget.questions[questionNumber]['question'],
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      QuestionBoxWidget(
                          answers, correctAnswer, callBack, selectedIndex),
                      FlatButton(
                          onPressed: () {
                            print('pressed');
                            setState(() {
                              if (currentSelection) {
                                correct++;
                              }
                              selectedIndex = null;
                              currentSelection = false;
                              questionNumber++;
                              correctAnswer = widget.questions[questionNumber]
                                  ['correct_answer'];
                              incorrectAnswers =
                                  widget.questions[questionNumber]
                                      ['incorrect_answers'];

                              answers = List.from(incorrectAnswers);
                              answers.add(correctAnswer);
                              answers.shuffle();
                            });
                          },
                          color: Colors.amber,
                          child: Text("Submit"))
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
