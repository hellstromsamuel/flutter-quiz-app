import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.chooseAnswer});

  final void Function(String) chooseAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.chooseAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex].question,
              style: GoogleFonts.lato(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              // style: const TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            // map out the answers into a list of widgets
            // ... spread operator: add the elements to the parent list
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: AnswerButton(
                      answerText: answer,
                      handleClick: () {
                        // executes when the anonymous function is called
                        answerQuestion(answer);
                      }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
