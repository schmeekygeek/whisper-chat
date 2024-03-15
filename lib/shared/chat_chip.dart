import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whisper_chat/providers/message_provider.dart';

class ChatChip extends StatelessWidget {
  final String text;
  final String from;
  const ChatChip({super.key, required this.text, required this.from});

  @override
  Widget build(BuildContext context) {

    bool isSelf = context.read<MessageProvider>().getSelfUsername == from;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: isSelf ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: isSelf ? const Radius.circular(10) : const Radius.circular(0),
              topRight: !isSelf ? const Radius.circular(10) : const Radius.circular(0),
              bottomLeft: const Radius.circular(10),
              bottomRight: const Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
