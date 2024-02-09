class QuizQuestion {
  QuizQuestion(this.text, this.answer);
  final String text;
  final List<String> answer;

  List<String> getSuffledAnswer() {
    final suffuledList = List.of(answer);
    suffuledList.shuffle();
    return suffuledList;
  }
}
