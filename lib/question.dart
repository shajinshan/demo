import 'package:flutter/material.dart';
import 'answer_button.dart';
import 'data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizQuestion extends StatefulWidget {
  const QuizQuestion({super.key, required this.onSelectedAnswer});

  //method for accepting
  final void Function(String answer) onSelectedAnswer;
//**************************** */
  @override
  State<QuizQuestion> createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  var currentIndex = 0;

  void switchIndex(String selectedAnswers) {
    widget.onSelectedAnswer(selectedAnswers);
    setState(() {
      currentIndex++;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = question[currentIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.cuteFont(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            ...currentQuestion.getSuffledAnswer().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    switchIndex(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
