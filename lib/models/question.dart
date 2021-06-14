class Question {
  final Answer question;
  final List<Answer> answers;

  Question({required this.question, required this.answers});

  bool status = false;
  bool isLock = false;
}

class Answer {
  final String tr;
  final String en;
  bool? isActive;

  Answer({required this.tr, required this.en, this.isActive});
}
