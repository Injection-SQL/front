import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:nuit22/questionType.dart';
import 'package:video_player/video_player.dart';

// number of questions we'll take from list
final nb_questions = 20;
// number of questions we'll take from list about IST
final nb_questions_ist = 10;

class Game extends StatefulWidget {
  const Game({super.key, required this.players});

  List<String> players;

  final db = Localstore.instance;
  final questions = await db.collection('data').get();
  final questionsIST = await db.collection('dataIST').get();

  @override
  State<Game> createState() => _Game();
}

// TODO init une liste de X questions

// TODO attribut avec la question actuelle
// TODO sélectionner une personne au pif selon le type de question
// TODO nouveau component question

class _Game extends State<Game> {
  List<Map<String, dynamic>> questions = [];
  Map<String, dynamic> actualQuestion;

  @override
  void initState() {
    super.initState();

    var randomQuestions = questions.toList();
    var randomQuestionsIST = questionsIST.toList();
    randomQuestions.shuffle();
    randomQuestionsIST.shuffle();
    var tmp = randomQuestions.getRange(nb_questions).toList();
    var tmpIST = randomQuestionsIST.getRange(nb_questions_ist).toList();

    tmp.addAll(tmpIST);

    for (var elem in tmp) {
      questions.add(elem);
    }

    questions.shuffle();
    actualQuestion = questions.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(200, 100, 200, 100),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 12,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(100, 100, 100, 100),
                    child: SingleChildScrollView(
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
                            child: Text(
                              "Question",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                            ),
                          ),
                          QuestionType(
                            title: 'type',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _nextQuestion() {}
}

class Question
