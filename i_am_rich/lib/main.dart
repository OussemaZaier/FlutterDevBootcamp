import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          title: const Text('I am rich'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey.shade700,
        ),
        body: Center(
          child: Container(
              child: const Image(
            image: AssetImage('images/diamond.png'),
          )),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
