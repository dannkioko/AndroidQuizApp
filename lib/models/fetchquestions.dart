import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Questions> fetchQuestions() async {
  String uri = 'https://opentdb.com/api.php?amount=5&category=9';
  final response = await http.get(uri, headers: {});
  if (response.statusCode == 200) {
    return Questions.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

class Questions {
  List<dynamic> questions;

  Questions({this.questions});

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(questions: json['results']);
  }
}
