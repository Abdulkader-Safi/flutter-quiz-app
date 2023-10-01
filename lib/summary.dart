import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary(
    this.summaryData, {
    super.key,
  });

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.60,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map(
              (e) => Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor:
                            e['user_answers'] == e['correct_answers']
                                ? Colors.blueAccent
                                : Colors.red[300],
                        child: Text(
                          ((e['questions_index'] as int) + 1).toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 250, 205, 254),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e['questions'].toString(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 250, 205, 254),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              e['correct_answers'].toString(),
                              style: const TextStyle(
                                color: Color.fromARGB(146, 250, 205, 254),
                              ),
                            ),
                            Text(
                              e['user_answers'].toString(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 49, 167, 203),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
