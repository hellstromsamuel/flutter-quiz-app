import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<QuizApp> {
  final List<String> selectedAnswers = [];
  String activeScreen = 'start-screen';

  @override
  void initState() {
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'questions-screen';
      selectedAnswers.clear();
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screen = QuestionsScreen(chooseAnswer: chooseAnswer);
    } else if (activeScreen == 'results-screen') {
      screen = ResultsScreen(
          restartQuiz: restartQuiz, selectedAnswers: selectedAnswers);
    }

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: screen,
        ),
      ),
    );
  }
}
