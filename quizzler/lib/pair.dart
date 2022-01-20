class Pair<S, B> {
  S question;
  B answer;
  Pair({this.question, this.answer});

  get getQuestion => this.question;

  set setQuestion(question) => this.question = question;

  get getAnswer => this.answer;

  set setAnswer(answer) => this.answer = answer;
}