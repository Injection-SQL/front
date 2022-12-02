import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:nuit22/prepare.dart';
import 'package:nuit22/game.dart';
import 'package:video_player/video_player.dart';

import 'infos.dart';

//final jsonCache = JsonAssetCache(basePath: "assets/");

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'PICOLO SIDA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        child: Stack(children: [
          //VideoPlayer(controller),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 100, 100, 100),
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
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
                      child: Text(
                      "PICOLO SIDA",
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: AnimatedButton(
                        text: 'Jouer',
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Prepare()),
                          );
                        },
                        width: 100,
                        gradient: const LinearGradient(colors: [Colors.green, Colors.green]),
                        selectedGradientColor: const LinearGradient(colors: [Colors.black12, Colors.black12]),
                        transitionType: TransitionType.BOTTOM_CENTER_ROUNDER,
                        selectedTextColor: Colors.white,
                        isReverse: true,
                        borderColor: Colors.white,
                        borderRadius: 5,
                        animatedOn: AnimatedOn.onHover,
                        textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: AnimatedButton(
                        text: 'Info',
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Infos()),
                          );
                        },
                        width: 100,
                        gradient: const LinearGradient(colors: [Colors.blue, Colors.blue]),
                        selectedGradientColor: const LinearGradient(colors: [Colors.black12, Colors.black12]),
                        transitionType: TransitionType.BOTTOM_CENTER_ROUNDER,
                        selectedTextColor: Colors.white,
                        isReverse: true,
                        borderColor: Colors.white,
                        borderRadius: 5,
                        animatedOn: AnimatedOn.onHover,
                        textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                      child: Center(child:Text(
                        "NUIT DE L'INFO 2022 - Killyan BOUR - Bastien BRISSON - Yoann FERNANDEZ - Rémi ROBILLIARD"),
                      ),
                      ),
                  ]
                )
              ),
            ),
          )
        )
      ),
          ]
              
    )));
  }
}
