import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key,required this.answerText,required this.onTap,});
  final String answerText;
  final void Function () onTap;



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap,style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 40),
        backgroundColor:const  Color.fromARGB(255, 9, 151, 9),
        foregroundColor: Colors.white,shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),),),
           child:  Text(answerText,textAlign: TextAlign.center,
           style: GoogleFonts.lato(color: Colors.white),));
  }
}
