import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Actionq extends StatefulWidget {
  const Actionq({Key? key, required this.q}) : super(key: key);

  final Map<String, dynamic> q;

  @override
  State<Actionq> createState() => _ActionqState();
}

class _ActionqState extends State<Actionq> {
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
