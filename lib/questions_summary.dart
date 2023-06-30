import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summary});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summary.map((data) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              // make width fit the content, and center it inside parent
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${(data['questionIndex'] as int) + 1}. ${data['question']}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                if (data['selectedAnswer'] == data['correctAnswer'])
                  const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 40,
                  ),
                if (data['selectedAnswer'] != data['correctAnswer'])
                  const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 40,
                  ),
              ],
            ),
            Text(
              data['selectedAnswer'] as String,
              style: const TextStyle(color: Colors.red, fontSize: 20),
            ),
            Text(
              data['correctAnswer'] as String,
              style: const TextStyle(color: Colors.green, fontSize: 20),
            ),
            const SizedBox(height: 10),
          ],
        );
      }).toList(),
    );
  }
}
