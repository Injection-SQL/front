import 'dart:convert';

import 'package:flutter/services.dart';

class Util {
  static List<Map<String, dynamic>> questionsJSON = [];
  static List<Map<String, dynamic>> questionsJSONIST = [];

  Future<void> initJSON() async {
    var responseJSON = await rootBundle.loadString('questions.json');
    var responseISTJSON = await rootBundle.loadString('questionsIST.json');
    questionsJSON = await json.decode(responseJSON);
    questionsJSONIST = await json.decode(responseISTJSON);
  }

  List<Map<String, dynamic>> getQuestionsJSON() {
    return questionsJSON;
  }

  List<Map<String, dynamic>> getQuestionsJSONIST() {
    return questionsJSONIST;
  }
}
