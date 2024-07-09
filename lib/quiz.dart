import 'package:flutter/material.dart';
import 'package:section2/data/questions.dart';
import 'package:section2/question_screen.dart';
import 'package:section2/result_screen.dart';

import 'package:section2/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  void switchScreen() async {
    try {
      await fetchData();
      setState(() {
        activeScreen = 'questions-screen';
      });
    } catch (e) {
      // Tampilkan pesan error kepada pengguna
      print('Error fetching questions: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void backHome() {
    setState(() {
      activeScreen = 'start-screen';
    });
    selectedAnswers = [];
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer, backHome);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScren(
        backHome,
        chosenAnswers: selectedAnswers,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
