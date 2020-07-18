import 'package:flutter/material.dart';
import 'package:quizapp/screens/home/homescreen.dart';

class ResultsScreen extends StatelessWidget {
  final int correct, outOf;
  final questions;
  ResultsScreen(this.correct, this.outOf, this.questions);
  @override
  Widget build(BuildContext context) {
    print(correct);
    return Scaffold(
        appBar: AppBar(
          title: Text("Results"),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen())),
          ),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 123, 121, 1),
                      borderRadius: BorderRadius.circular(150),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 60,
                          top: 50,
                          child: Text(
                            correct.toString(),
                            style: TextStyle(
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ),
                        Positioned(
                          left: 110,
                          top: 50,
                          child: Text(
                            "/",
                            style: TextStyle(fontSize: 150),
                          ),
                        ),
                        Positioned(
                          left: 160,
                          top: 90,
                          child: Text(
                            outOf.toString(),
                            style: TextStyle(fontSize: 150),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                        },
                        child: Text("   New quiz "),
                        color: Colors.amber,
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text("View Answers"),
                        color: Colors.amber,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
