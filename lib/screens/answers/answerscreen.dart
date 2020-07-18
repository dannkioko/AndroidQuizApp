import 'package:flutter/material.dart';
import 'package:quizapp/screens/answers/components/answerbox.dart';
import 'package:quizapp/screens/answers/components/buttons.dart';

class AnswerScreen extends StatefulWidget {
  final questions;

  AnswerScreen(this.questions);

  @override
  _AnswerScreenState createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  int questionNumber = 0;
  var incorrectAnswers, correctAnswer;
  int outOf = 5;
  List<dynamic> answers;

  @override
  void initState() {
    correctAnswer = widget.questions[questionNumber]['correct_answer'];
    incorrectAnswers = widget.questions[questionNumber]['incorrect_answers'];
    answers = List.from(incorrectAnswers);
    answers.add(correctAnswer);
    answers.shuffle();
    super.initState();
  }

  void callBack(a) {
    if ((questionNumber > 0 && questionNumber < outOf - 1) ||
        (questionNumber == 0 && a) ||
        (questionNumber == outOf - 1 && !a)) {
      setState(() {
        if (a) {
          questionNumber++;
          correctAnswer = widget.questions[questionNumber]['correct_answer'];
          incorrectAnswers =
              widget.questions[questionNumber]['incorrect_answers'];

          answers = List.from(incorrectAnswers);
          answers.add(correctAnswer);
          answers.shuffle();
        } else {
          questionNumber--;
          correctAnswer = widget.questions[questionNumber]['correct_answer'];
          incorrectAnswers =
              widget.questions[questionNumber]['incorrect_answers'];

          answers = List.from(incorrectAnswers);
          answers.add(correctAnswer);
          answers.shuffle();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Container(
              height: 100,
            ),
            Column(
              children: <Widget>[
                Container(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: questionNumber < outOf
                              ? Text(
                                  widget.questions[questionNumber]['question'],
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              : null,
                        ),
                      ),
                      AnswerBox(answers, correctAnswer),
                      Buttons(callBack),
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
