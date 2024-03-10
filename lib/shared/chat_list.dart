import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/message_provider.dart';
import 'chat_chip.dart';
import '../classes/message.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    List<Message> messages = context.watch<MessageProvider>().getMessages;
    return Container(
      height: 540,
      color: Colors.grey,
      child: ListView(
        children: [
          for (Message message in messages)
          ChatChip(text: message.body, from: message.from.username)
        ],
      ),
    );
  }
}
