import 'package:flutter/material.dart';

class RestartButton extends StatelessWidget {
  const RestartButton(this.backHome, {super.key});

  final Function() backHome;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(
        Icons.refresh,
        color: Colors.white,
      ),
      onPressed: backHome,
      label: const Text(
        "Restart Quiz!",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
