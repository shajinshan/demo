import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Text(((data['question-index'] as int) + 1).toString(),style: TextStyle(color: Colors.white),),
                Expanded(
                  child: Container(margin: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'] as String,style: TextStyle(color: Colors.white),),
                        const SizedBox(height: 5,),
                        Text(data['correct-answer'] as String,style: TextStyle(color: Color.fromARGB(255, 8, 231, 16))),
                        Text(data['user -answer'] as String,style: TextStyle(color: const Color.fromARGB(255, 255, 0, 0))),
                      ],
                    ),
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
