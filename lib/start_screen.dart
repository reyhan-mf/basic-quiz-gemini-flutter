import 'package:flutter/material.dart';

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
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(128, 248, 248, 248),
          ),
          const SizedBox(height: 15 * 3),
          const Text(
            "Nah, We'd Cook!",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 25),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
            icon: const Icon(Icons.play_arrow),
            label: const Text("Start Quiz"),
          ),

        ],
      ),
    );
  }
}
