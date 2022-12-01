import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:nuit22/questionType.dart';
import 'package:video_player/video_player.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.title});

  final String title;


  @override
  State<QuestionsScreen> createState() => _QuestionsScreen();
}

class _QuestionsScreen extends State<QuestionsScreen> {
/*
  late VideoPlayerController controller;

  @override
  initState() {
    controller = VideoPlayerController.asset('video.mp4');
    controller.initialize();
    controller.play();
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value){
      setState(() {});
    });

  }*/
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
      body: Center(
        child: Stack(
        children: [
          //VideoPlayer(controller),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(200, 100, 200, 100),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 12,
              child:
              Padding(
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
                    QuestionType(title: 'type',),
                  ]
                )
              ),
            ),
          )
        )
      ),
      ]),
    ),
    );
  }


}

