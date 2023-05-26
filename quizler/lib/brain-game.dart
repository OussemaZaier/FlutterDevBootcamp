import 'package:quizler/question.dart';

class BrainGame {
  int i = 0;
  final List<Question> _questionsList = [
    Question(quest: 'Some cats are actually allergic to humans', resp: true),
    Question(
        quest: 'You can lead a cow down stairs but not up stairs.',
        resp: false),
    Question(
        quest: 'Approximately one quarter of human bones are in the feet.',
        resp: true),
    Question(quest: 'A slug\'s blood is green.', resp: true),
    Question(
        quest: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        resp: true),
    Question(
        quest: 'It is illegal to pee in the Ocean in Portugal.', resp: true),
    Question(
        quest:
            'No piece of square dry paper can be folded in half more than 7 times.',
        resp: false),
    Question(
        quest:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        resp: true),
    Question(
        quest:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        resp: false),
    Question(
        quest:
            'The total surface area of two human lungs is approximately 70 square metres.',
        resp: true),
    Question(quest: 'Google was originally called \"Backrub\".', resp: true),
    Question(
        quest:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        resp: true),
    Question(
        quest:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        resp: true),
  ];
  void nextQuest() {
    if (i < _questionsList.length - 1) {
      i++;
    }
  }

  String getQuest() {
    return _questionsList[i].quest;
  }

  bool getResp() {
    return _questionsList[i].resp;
  }

  bool isFinished() {
    return i >= _questionsList.length - 1;
  }

  void resetCount() {
    i = 0;
  }

  int numbQuest() {
    return _questionsList.length;
  }
}
