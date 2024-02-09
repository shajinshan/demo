import 'package:flutter/material.dart';
import 'asserts.dart';

class Columner extends StatelessWidget {
  const Columner(this.QuizState, {super.key});
  final void Function() QuizState;

  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(logoImage),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
            onPressed: QuizState,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
