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
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('images/oussema.png'),
                radius: 50.0,
              ),
              Text(
                'Med Oussema Zaier',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.teal.shade100,
                ),
              ),
              const Text(
                'software engineer',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                  color: Colors.white,
                  letterSpacing: 5,
                ),
              ),
              const SizedBox(
                width: 200,
                child: Divider(
                  height: 20,
                  thickness: 2,
                ),
              ),
              CardTemp(
                text: 'medoussemazaier@gmail.com',
                icon1: IconData(0xe22a, fontFamily: 'MaterialIcons'),
              ),
              CardTemp(
                text: '+216 25 117 179',
                icon1: IconData(Icons.phone.codePoint,
                    fontFamily: 'MaterialIcons'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardTemp extends StatelessWidget {
  IconData icon1;
  String text;
  CardTemp({required this.icon1, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      color: Colors.white,
      elevation: 5,
      child: ListTile(
        leading: Icon(
          icon1,
          color: Colors.teal.shade100,
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 19.0,
            color: Colors.teal.shade900,
            fontFamily: 'Source Sans Pro',
          ),
        ),
      ),
    );
  }
}
