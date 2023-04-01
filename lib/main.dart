import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

int getNumber() => Random().nextInt(6) + 1;

class _MyAppState extends State<MyApp> {
  var diceNumber = getNumber();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Dice Roller",
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Image.asset('assets/dice_$diceNumber.png'),
                Text('$diceNumber'),
                ElevatedButton(
                    onPressed: () => {
                          setState(
                            () {
                              diceNumber = getNumber();
                            },
                          )
                        },
                    child: const Text(
                      "Roll Dice",
                    )),
              ],
            ),
          )),
    );
  }
}
