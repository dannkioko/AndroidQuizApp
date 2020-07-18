import 'package:flutter/material.dart';
import 'package:quizapp/screens/home/homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Color.fromRGBO(97, 149, 237, 1),
        primaryColor: Color.fromRGBO(255, 123, 121, 1),
      ),
      home: HomeScreen(),
    );
  }
}
