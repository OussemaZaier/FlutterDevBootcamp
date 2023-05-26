import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final player = AudioCache();
  void playSound(int i) {
    player.play('note$i.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Xylophone',
            style: TextStyle(color: Colors.red),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              for (int i = 1; i < 8; i++) pianoButton(Colors.red.shade100, i)
            ],
          ),
        ),
      ),
    );
  }

  Expanded pianoButton(Color color, int i) {
    return Expanded(
      child: TextButton(
        onPressed: (() {
          playSound(i);
        }),
        style: TextButton.styleFrom(
          enableFeedback: false,
          padding: EdgeInsets.all(0),
        ),
        child: Container(
          color: Colors.red[100 * i],
        ),
      ),
    );
  }
}
