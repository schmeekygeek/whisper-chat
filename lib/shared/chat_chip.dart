import 'package:flutter/material.dart';

class ChatChip extends StatelessWidget {
  final String text;
  final String from;
  const ChatChip({super.key, required this.text, required this.from});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(from),
        Text(text),
        const Divider(),
      ],
    );
  }
}
