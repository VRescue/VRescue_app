import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sangrakshan/global/color.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/user/disaster.png',
            width: 400,
          ),
          const SizedBox(height: 60,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Learn about CBRNE (Chemical, Biological, Radiological, Nuclear, and Explosive) disasters with this quiz!',
              style: GoogleFonts.lato(
                color: kblackHeading,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: kwhite,
              backgroundColor: kdarkBlueMuted,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}