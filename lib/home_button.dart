import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(
        Icons.home,
        color: Colors.white,
      ),
      onPressed: onTap, // Gunakan backHome yang sekarang sudah didefinisikan
      label: const Text(
        "Home",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
