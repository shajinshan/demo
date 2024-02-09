import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.onRestart,
    required this.onHome,
  });
  final void Function() onHome;
  final void Function() onRestart;
  //for listing  selected answer
  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryDate() {
    
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question-index': i,
        'question': question[i].text,
        'correct-answer': question[i].answer[0],
        'user -answer': chosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryDatas = getSummaryDate();
    final numTotalQuestion = question.length;
    final numCorrectAnswer = summaryDatas.where((data) {
      return data['user -answer'] == data['correct-answer'];
    }).length;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You Answered $numCorrectAnswer  Questin Out of $numTotalQuestion Questions',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionSummary(summaryData: summaryDatas),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(onPressed: onRestart,style: ElevatedButton.styleFrom(backgroundColor: Colors.red),icon: Icon(Icons.restart_alt), label: Text('Restart Quiz')),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                  onPressed: onHome,
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.black,backgroundColor: Color.fromARGB(255, 142, 238, 94)),
                  icon: const Icon(Icons.home),
                  label: const Text('Home'))
              //If u want Button Add Here
              //*************************
              //*******************
              //******************
              //
              //
              //
              //
              //
              //
              //
              // */ */ */
            ],
          ),
        ),
      ),
    );
  }
}
