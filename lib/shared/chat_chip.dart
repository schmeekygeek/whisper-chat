import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whisper_chat/providers/message_provider.dart';

import '../classes/message.dart';

class ChatChip extends StatelessWidget {
  final Message message;
  const ChatChip({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    bool isSelf = context.read<MessageProvider>().getSelfUsername == message.from.username;
    print(message.type);
    
    if (message.type == 'matched' || message.type == 'disconnected') {
      return Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 30 / 100,
          ),
          child: Text('${message.from.username} ${message.type}'),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: isSelf ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 70/100,
          ),
          decoration: BoxDecoration(
            color: isSelf ? Colors.greenAccent : Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: isSelf ? const Radius.circular(15) : const Radius.circular(0),
              topRight: !isSelf ? const Radius.circular(15) : const Radius.circular(0),
              bottomLeft: const Radius.circular(15),
              bottomRight: const Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(message.body),
          ),
        ),
      ),
    );
  }
}
