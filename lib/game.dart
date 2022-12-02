import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:asset_cache/asset_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuit22/questions.dart';

import 'action.dart';
import 'choices.dart';

// number of questions we'll take from list
const nbQuestions = 20;
// number of questions we'll take from list about IST
const nbQuestionsIst = 10;

final jsonCache = JsonAssetCache(basePath: ".");

class Game extends StatefulWidget {
  const Game({super.key, required this.players});

  final List<String> players;

  @override
  State<Game> createState() => _Game();
}

class _Game extends State<Game> {
  List<Map<String, dynamic>> questions = [];
  Map<String, dynamic> actualQuestion = {};
  bool isLoading = true;
  String currentPlayer = '';

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  Future<void> _loadJson() async {
    final String responseJSON = await rootBundle.loadString('questions.json');
    final questionsJSON = await json.decode(responseJSON);
    final String responseISTJSON =
        await rootBundle.loadString('questionsIST.json');
    final questionsJSONIST = await json.decode(responseISTJSON);

    var randomQuestions = questionsJSON.toList();
    var randomQuestionsIST = questionsJSONIST.toList();
    randomQuestions.shuffle();
    randomQuestionsIST.shuffle();
    var tmp = randomQuestions.getRange(0, nbQuestions).toList();
    var tmpIST = randomQuestionsIST.getRange(0, nbQuestionsIst).toList();

    tmp.addAll(tmpIST);
    for (var elem in tmp) {
      questions.add(elem);
    }

    questions.shuffle();
    _nextQuestion();
    setState(() {
      questions = questions.toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = Question(
      q: actualQuestion,
    );

    if (actualQuestion['type'].toString() == 'CHOICE') {
      widget = Choices(q: actualQuestion);
    } else if (actualQuestion['type'].toString() == 'ACTION') {
      widget = Actionq(q: actualQuestion);
    }
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: Text('Chargement en cours !'),
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
                        children: <Widget>[
                          Text(currentPlayer),
                          widget,
                          ElevatedButton(
                            onPressed: () => _nextQuestion(),
                            child: const Text('Suivant'),
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
    if (questions.isNotEmpty) {
      var random = Random();
      setState(() {
        actualQuestion = questions.removeLast();
        currentPlayer = widget.players[random.nextInt(widget.players.length)];
      });
    }
  }
}
