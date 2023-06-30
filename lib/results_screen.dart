import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.restartQuiz, required this.selectedAnswers});

  final void Function() restartQuiz;
  final List<String> selectedAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < questions.length; i++) {
      final question = questions[i];
      final selectedAnswer = selectedAnswers[i];
      final correctAnswer = question.answers[0];

      summary.add({
        'questionIndex': i,
        'question': question.question,
        'selectedAnswer': selectedAnswer,
        'correctAnswer': correctAnswer,
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final correctAnswers = summaryData.where((data) {
      return data['selectedAnswer'] == data['correctAnswer'];
    }).length;

    String resultText = 'Du svarte $correctAnswers spørsmål riktig ;)';
    if (correctAnswers == 0) {
      resultText = 'Du svarte ingen spørsmål riktig :)';
    } else if (correctAnswers == questions.length) {
      resultText = 'Du svarte alle spørsmål riktig! :)';
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultText,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          QuestionsSummary(summary: summaryData),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              restartQuiz();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            child: const Text(
              'Restart Quiz',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
