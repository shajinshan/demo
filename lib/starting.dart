import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';
import 'menu.dart';
import 'question.dart';
import 'asserts.dart';

class StartScreen extends StatefulWidget {
  StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
//Stoing Selected Answer
  List<String> selectedAnswers = [];
//***************** */
//replace ActiveScreen(current State)
  var currentState = 'starting-state';

  void switchState() {
    setState(() {
      currentState = 'Question-page';
    });
  }

  //Method for Storing Answer
  //Storing
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == question.length) {
      setState(() {
        currentState = 'result-state';
      });
    }
  }

  //Restart Button
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      currentState = 'Question-page';
    });
  }
//back Home
  void onSwitchHome() {
    setState(() {
      selectedAnswers = [];
    currentState = 'starting-state';
    });
  }

//************************* */
  @override
  Widget build(context) {
    Widget screenWidget = Columner(switchState);
    if (currentState == 'Question-page') {
      screenWidget = QuizQuestion(onSelectedAnswer: chooseAnswer);
    }
    if (currentState == 'result-state') {
      screenWidget = ResultScreen(
        chosenAnswer: selectedAnswers,
        onRestart: restartQuiz,
        onHome: onSwitchHome,
      );
    }

    return Container(
        decoration: BoxDecoration(
          color:colorsForBackground),
        child: screenWidget);
  }
}
