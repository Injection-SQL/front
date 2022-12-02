import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:nuit22/prepare.dart';
import 'package:video_player/video_player.dart';

import 'infos.dart';


class Infos extends StatefulWidget {
  const Infos({super.key});

  @override
  State<Infos> createState() => _Infos();
}

class _Infos extends State<Infos> {
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
                      padding: const EdgeInsets.fromLTRB(100, 100, 100, 100),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 12,
                        child:
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
                          child: SingleChildScrollView(
                              child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                                      child: Text(
                                        "LIENS UTILES",
                                        style: TextStyle(
                                            fontSize: 30, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: AnimatedButton(
                                        text: 'sida-info-service.org',
                                        onPress: () {  },
                                        width: 300,
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
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: AnimatedButton(
                                        text: 'sexualites-info-sante.fr',
                                        onPress: () {  },
                                        width: 300,
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
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: AnimatedButton(
                                        text: 'hepatites-info-service.org',
                                        onPress: () {  },
                                        width: 300,
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
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: AnimatedButton(
                                        text: 'vih-info-soignants.fr',
                                        onPress: () {  },
                                        width: 300,
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
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: AnimatedButton(
                                        text: 'ligneazur.org',
                                        onPress: () {  },
                                        width: 300,
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

                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: AnimatedButton(
                                        text: 'Retour',
                                        onPress: () {
                                          Navigator.pop(context);
                                        },
                                        width: 100,
                                        gradient: const LinearGradient(colors: [Colors.red, Colors.red]),
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
