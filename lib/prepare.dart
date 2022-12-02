/*
   author: tetenpapier <tetenpapier@proton.me>

   Preparation screen for a game.
*/

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

import 'game.dart';

class Prepare extends StatefulWidget {
  const Prepare({super.key});

  @override
  State<Prepare> createState() => PrepareState();
}

class PrepareState extends State<Prepare> {
  List<String> players = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 150, 50, 150),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(100, 100, 100, 100),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: name,
                            decoration: const InputDecoration(
                              hintText: 'Nom du joueur',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Entrez un nom.';
                              }

                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: AnimatedButton(
                              text: 'Ajouter le joueur',
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  _addPlayer(name.text.toString());
                                  name.clear();
                                }
                              },
                              width: 300,
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
                        ],
                      ),
                    ),
                    ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      itemCount: players.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          color: Colors.red.shade50,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(players[index]),
                                ElevatedButton(
                                  child: const Text('Remove'),
                                  onPressed: () => _removePlayer(index),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: AnimatedButton(
                        text: 'Lancer le jeu',
                        onPress: () {
                          _startGame(players);
                        },
                        width: 300,
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }

  void _addPlayer(String name) {
    setState(() => players.add(name));
  }

  void _removePlayer(int id) {
    setState(() => players.removeAt(id));
  }

  void _startGame(List<String> players) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Game(players: players)),
  );
  }
}
