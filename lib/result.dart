import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/summary.dart';

class Result extends StatelessWidget {
  const Result(
    this.selectedAnswers,
    this.restart, {
    super.key,
  });

  final List<String> selectedAnswers;
  final void Function() restart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'questions_index': i,
        'questions': questions[i].text,
        'correct_answers': questions[i].answers[0],
        'user_answers': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var numOfCorrectAnswers = 0;
    for (var element in summaryData) {
      if (element['user_answers'] == element['correct_answers']) {
        numOfCorrectAnswers++;
      }
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "You answered $numOfCorrectAnswers out of ${questions.length} questions correctly.",
            style: const TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Summary(summaryData),
          const SizedBox(height: 30),
          TextButton.icon(
            onPressed: restart,
            icon: const Icon(
              Icons.restart_alt_outlined,
              color: Color.fromARGB(255, 250, 205, 254),
            ),
            label: const Text(
              "Restart Quiz!",
              style: TextStyle(
                color: Color.fromARGB(255, 250, 205, 254),
              ),
            ),
          )
        ],
      ),
    );
  }
}
