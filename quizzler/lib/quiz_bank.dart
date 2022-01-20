import 'package:quizzler/pair.dart';

class QuizBank {
  int _questionNumber = 0;

  List<Pair<String, bool>> _questions = [
    Pair<String, bool>(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Pair<String, bool>(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Pair<String, bool>(question: 'A slug\'s blood is green.', answer: true),
    Pair<String, bool>(
        question: 'Some cats are actually allergic to humans', answer: true),
    Pair<String, bool>(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Pair<String, bool>(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Pair<String, bool>(question: 'A slug\'s blood is green.', answer: true),
    Pair<String, bool>(
        question: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        answer: true),
    Pair<String, bool>(
        question: 'It is illegal to pee in the Ocean in Portugal.',
        answer: true),
    Pair<String, bool>(
        question:
            'No piece of square dry paper can be folded in half more than 7 times.',
        answer: false),
    Pair<String, bool>(
        question:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        answer: true),
    Pair<String, bool>(
        question:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        answer: false),
    Pair<String, bool>(
        question:
            'The total surface area of two human lungs is approximately 70 square metres.',
        answer: true),
    Pair<String, bool>(
        question: 'Google was originally called \"Backrub\".', answer: true),
    Pair<String, bool>(
        question:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        answer: true),
    Pair<String, bool>(
        question:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        answer: true),
  ];

  get length => this._questions.length;

  get questionNumber => this._questionNumber;

  set questionNumber(int num) => this._questionNumber = num;

  String getQuestionText() {
    return this._questions[questionNumber].getQuestion;
  }

  bool getAnswer() {
    return this._questions[questionNumber].getAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < this._questions.length - 1) {
      _questionNumber++;
    }
  }
}
