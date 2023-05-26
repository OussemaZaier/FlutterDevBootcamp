import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizler/brain-game.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  BrainGame brainGame = new BrainGame();
  late int trueN = 0, falseN;
  void checkAnswer(bool answer) {
    if (brainGame.isFinished()) {
      falseN = brainGame.numbQuest();
      showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text('Finished!'),
              content: Text('your score is$trueN/$falseN'),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      brainGame.resetCount();
                      scoreKeeper = [];
                      Navigator.of(context).pop();
                    });
                  },
                  child: const Text('reset'),
                ),
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text('exit'),
                ),
              ],
            )),
      );
    } else {
      if (brainGame.getResp() == answer) {
        scoreKeeper.add(
          const Icon(
            Icons.check,
            color: Colors.green,
            size: 25,
          ),
        );
        trueN++;
      } else {
        scoreKeeper.add(
          const Icon(
            Icons.close,
            color: Colors.red,
            size: 25,
          ),
        );
      }
      brainGame.nextQuest();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                brainGame.getQuest(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  checkAnswer(true);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  checkAnswer(false);
                });
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper.isEmpty
              ? [
                  const SizedBox(
                    height: 25,
                  ),
                ]
              : scoreKeeper,
        ),
      ],
    );
  }
}
