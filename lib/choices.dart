import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Choices extends StatefulWidget {
  const Choices({Key? key, required this.q}) : super(key: key);

  final Map<String, dynamic> q;

  @override
  State<Choices> createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
  List<Widget> body = <Widget>[];
  @override
  void initState() {
    super.initState();
    body.removeRange(0, body.length);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      body.removeRange(0, body.length);
    });
    if (widget.q["title"] != null) {
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
      body.add(Text(
        widget.q["text"].toString(),
        style: const TextStyle(
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ));
    }

    if (widget.q["choices"] != null) {
      body.add(Text(
        widget.q["choices"][0] + "\t" + widget.q["choices"][1],
        style: const TextStyle(
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ));
    }

    if (widget.q["answer"] != null && widget.q["choices"] != null) {
      body.add(
        ElevatedButton(
          onPressed: () {
            setState(() {
              //body.removeRange(0, body.length);
              body.add(Text(
                  "Réponse : ${widget.q["choices"][widget.q["answer"]]}",
                  style: const TextStyle(fontSize: 20)));
            });
          },
          child: const Text("Voir réponse"),
        ),
      );
    }

    if (widget.q["link"] != null) {
      body.add(IconButton(
          onPressed: () {
            launchUrlString(widget.q["link"]);
          },
          icon: const Icon(Icons.info_outline)));
    }

    return Column(
      children: body,
    );
  }
}
