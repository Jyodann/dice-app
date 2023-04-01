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

int getNumber() => Random().nextInt(5) + 1;

class _MyAppState extends State<MyApp> {
  var diceNumber = getNumber();
  var imgList = List<Image>.generate(
    6,
    (index) => Image.asset('assets/dice_${index + 1}.png'),
  );
  @override
  void initState() {
    super.initState();

    for (var img in imgList) {
      precacheImage(img.image, context);
    }
  }

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
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              direction: Axis.vertical,
              children: [
                Expanded(
                  flex: 2,
                  child: imgList[diceNumber],
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text('You got the number: ${diceNumber + 1}'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
