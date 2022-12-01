/*
   author: tetenpapier <tetenpapier@proton.me>

   Preparation screen for a game.
*/

import 'package:flutter/material.dart';

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
    return Center(
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
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _addPlayer(name.text.toString());
                                name.clear();
                              }
                            },
                            child: const Text('Ajouter le joueur'),
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
                                Text('${players[index]}'),
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
                    ElevatedButton(
                      onPressed: () => _startGame(),
                      child: const Text('Lancer le jeu'),
                    ),
                  ],
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

  void _startGame() {
    // TODO navigation vers écran de jeu avec la liste des joueurs en paramètres
  }
}
