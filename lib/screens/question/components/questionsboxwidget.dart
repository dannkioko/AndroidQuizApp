import 'package:flutter/material.dart';
import 'package:quizapp/screens/question/components/questionwidget.dart';

class QuestionBoxWidget extends StatefulWidget {
  final answers;
  final correctAnswer;
  final callBack;
  var selected;

  QuestionBoxWidget(
      this.answers, this.correctAnswer, this.callBack, this.selected);

  @override
  _QuestionBoxWidgetState createState() => _QuestionBoxWidgetState();
}

class _QuestionBoxWidgetState extends State<QuestionBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 400,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
                widget.answers.length,
                (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.selected = index;
                      });
                      if (widget.correctAnswer == widget.answers[index]) {
                        widget.callBack(true, widget.selected);
                      } else {
                        widget.callBack(false, widget.selected);
                      }
                    },
                    child: index == widget.selected
                        ? QuestionWidget(widget.answers[index],
                            Color.fromRGBO(255, 123, 121, 1))
                        : QuestionWidget(
                            widget.answers[index], Colors.blueGrey)))),
      ),
    );
  }
}
