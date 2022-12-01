import 'package:flutter/cupertino.dart';

class QuestionType extends StatefulWidget {
  const QuestionType({super.key, required this.title});

  final String title;


  @override
  State<QuestionType> createState() => _QuestionType();
}

class _QuestionType extends State<QuestionType> {
  @override
  Widget build(BuildContext context) {
    return Text("type1");
  }

}