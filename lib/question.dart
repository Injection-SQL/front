import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Question extends StatefulWidget {
  const Question({Key? key, required this.q}) : super(key: key);

  final Map<String, dynamic> q;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    List<Widget> body = <Widget>[];

    if (widget.q["title"] != null) {
      body.add(Text(
        widget.q["title"],
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ));
    }

    if (widget.q["text"] != null) {
      body.add(Text(
        widget.q["text"],
        style: const TextStyle(
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ));
    }

    if (widget.q["answer"] != null) {
      body.add(ElevatedButton(
          onPressed: () {
            body.add(
              Text(
                "Réponse : ${widget.q["answer"]}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          },
          child: const Text("Voir réponse")));
    }

    if (widget.q["link"] != null) {
      body.add(IconButton(
          onPressed: () {
            launchUrlString(widget.q["link"]);
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
