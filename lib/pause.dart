/*
   author: tetenpapier <tetenpapier@proton.me>

   Pause modal
*/

import 'package:flutter/material.dart';


class Pause extends StatelessWidget {
  const Pause({super.key});

  // This widget is the root of your application.
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: ElevatedButton(
                    onPressed: () {

                    },
                    child: Text("Redémarrer"),
                  ),
                  ),
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: Text("Pour en savoir plus"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
