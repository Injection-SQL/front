import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:asset_cache/asset_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:video_player/video_player.dart';

import 'package:nuit22/questionType.dart';
import 'package:nuit22/util.dart';

// number of questions we'll take from list
final nb_questions = 20;
// number of questions we'll take from list about IST
final nb_questions_ist = 10;

final jsonCache = JsonAssetCache(basePath: ".");

class Game extends StatefulWidget {
  const Game({super.key, required this.players});

  final List<String> players;

  /*
  final db = Localstore.instance;
  final questions = await db.collection('data').get();
  final questionsIST = await db.collection('dataIST').get();
  */

  @override
  State<Game> createState() => _Game();
}

// TODO init une liste de X questions

// TODO attribut avec la question actuelle
// TODO sélectionner une personne au pif selon le type de question
// TODO bouton suivant

class _Game extends State<Game> {
  List<Map<String, dynamic>> questions = [];
  Map<String, dynamic> actualQuestion = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  Future<void> _loadJson() async {
    /*
    print("====================");
    //final questionsJSON = await jsonCache.load('questions.json');
    //final questionsJSONIST = await jsonCache.load('questionsIST.json');
    final String responseJSON = await rootBundle.loadString('questions.json');
    final questionsJSON = await json.decode(responseJSON);
    print("====================");
    //final String responseISTJSON = await rootBundle.loadString('questionsIST.json');
    print("====================");
    print("====================");
    //final questionsJSONIST = await json.decode(responseISTJSON);
    final questionsJSONIST = questionsJSON.toList();


    */
    var u = Util();
    //final questionsJSONIST = await jsonCache.load('questionsIST.json');
    print("====================");
    //await DefaultAssetBundle.of(context).loadString("assets/data.json");
    print("====================");
    var randomQuestions = u.getQuestionsJSON().toList();
    print("====================");
    var randomQuestionsIST = u.getQuestionsJSONIST().toList();
    print("====================");
    randomQuestions.shuffle();
    randomQuestionsIST.shuffle();
    print("====================");
    var tmp = randomQuestions.getRange(0, nb_questions).toList();
    print("====================");
    var tmpIST = randomQuestionsIST.getRange(0, nb_questions_ist).toList();
    print("====================");


    tmp.addAll(tmpIST);
    print("====================");

    for (var elem in tmp) {
      questions.add(elem);
    }

    questions.shuffle();
    _nextQuestion();
    setState(() {
      questions = questions.toList();
      isLoading = false;
    });
    print(actualQuestion);
    print("====================");
  }

  @override
  Widget build(BuildContext context) {
    print("=---------------------");
    print(actualQuestion);

    if (isLoading) {
      return Scaffold(
        body: Center(
          child: const Text('Chargement en cours !'),
        ),
      );
    }

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

  _nextQuestion() {
    if (questions.length > 0) {
      setState(() {
        actualQuestion = questions.removeLast();
      });
    }
  }
}
