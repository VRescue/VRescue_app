import 'package:flutter/material.dart';

import 'package:sangrakshan/data/questions_data.dart';
import 'package:sangrakshan/global/color.dart';
import 'package:sangrakshan/views/questions_screen.dart';
import 'package:sangrakshan/views/result_screen.dart';
import 'package:sangrakshan/views/start_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> _selectedAnswers = [];
  var _activeScreen = 'start-screen';

  void _switchScreen() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(_switchScreen);

    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: _chooseAnswer,
      );
    }

    if (_activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("SANGRAKSHAN"),
        centerTitle: true,
      ),
      backgroundColor: klightPurple,
        body: Container(
          child: screenWidget,
        ),
      );
  }
}