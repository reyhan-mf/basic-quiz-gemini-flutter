import 'package:flutter/material.dart';
import 'package:section2/data/questions.dart';
import 'package:section2/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:section2/restart_button.dart';

class ResultScren extends StatelessWidget {
  const ResultScren(this.backHome, {super.key, required this.chosenAnswers});

  final Function() backHome;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answers': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['correct_answer'] == data['user_answers'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions correctly!",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary((getSummaryData())),
            const SizedBox(
              height: 30,
            ),
            RestartButton(backHome),
          ],
        ),
      ),
    );
  }
}
