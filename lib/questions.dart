import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Question extends StatefulWidget {
  Question({Key? key, required this.q}) : super(key: key);

  Map<String, dynamic> q = {};

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    List<Widget> body = <Widget>[];

    print("Debut build");

    if (widget.q["title"] != null) {
      print("if widget.q[title] != null" + widget.q["title"]);
      body.add(Text(
        widget.q["title"].toString(),
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ));
    }

    if (widget.q["text"] != null) {
      print("if widget.q[text] != null" + widget.q["text"]);
      body.add(Text(
        widget.q["text"].toString(),
        style: const TextStyle(
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ));
    }

    if (widget.q["answer"] != null) {
      print("if widget.q[answer] != null" + widget.q["answer"]);
      body.add(ElevatedButton(
          onPressed: () {
            body.add(
              Text(
                "Réponse : " + widget.q["answer"].toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          },
          child: const Text("Voir réponse")));
    }

    if (widget.q["link"] != null) {
      print("wif idget.q[link] != null" + widget.q["link"]);
      body.add(IconButton(
          onPressed: () {
            //launchUrlString(widget.q["link"].toString());
          },
          icon: Icon(Icons.info_outline)));
    }

    return Container(
      child: Column(
        children: body,
      ),
    );
  }
}
