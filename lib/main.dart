import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.black,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  late ShakeDetector detector;
  int diceNumber1 = 1;
  int diceNumber2 = 1;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        diceNumber1 = random.nextInt(6) + 1;
        diceNumber2 = random.nextInt(6) + 1;
      });
    });
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image(
                width: 200,
                height: 200,
                image: AssetImage('images/dice$diceNumber1.png'),
                color: Colors.pinkAccent,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image(
                width: 200,
                height: 200,
                image: AssetImage('images/dice$diceNumber2.png'),
                color: Colors.pinkAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
