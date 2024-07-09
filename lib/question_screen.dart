import 'package:flutter/material.dart';
import 'package:section2/answer_button.dart';
import 'package:section2/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:section2/home_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.backHome,
      {super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  final void Function() backHome;
  @override
  State<QuestionScreen> createState() {
    // ignore: no_logic_in_create_state
    return _QuestionScreen(backHome);
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  _QuestionScreen(this.backHome);
  
  var currentQuestionIndex = 0;
  final Function() backHome; // Deklarasikan backHome sebagai properti

// Inisialisasi backHome dalam konstruktor

  void answerQuestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);
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
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
            const SizedBox(
              height: 25,
            ),
            HomeButton(onTap: backHome),
          ],
        ),
      ),
    );
  }
}





//   @override
//   Widget build(context) {
//     final currentQuestion = questions[currentQuestionIndex];
//     return SizedBox(
//       width: double.infinity,
//       child: Container(
//         margin: const EdgeInsets.all(40),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               currentQuestion.text,
//               style: GoogleFonts.lato(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 30),
//             ...currentQuestion.getShuffledAnswers().map((answer) {
//               return AnswerButton(
//                 answerText: answer,
//                 onTap: () {
//                   answerQuestion(answer);
//                 },
//               );
//             }),
//             const SizedBox(height: 25),
//             Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   HomeButton(onTap: backHome),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
