import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/message_provider.dart';
import 'chat_chip.dart';
import '../classes/message.dart';

class ChatList extends StatefulWidget {
  final ScrollController scrollController;
  const ChatList({super.key, required this.scrollController});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    List<Message> messages = context.watch<MessageProvider>().getMessages;
    return Expanded(
      child: ListView.builder(
        itemCount: messages.length,
        controller: widget.scrollController,
        itemBuilder: (
          BuildContext context,
          int index
        ) {
          return ChatChip(message: messages[index],);
        }
      ),
    );
  }
}
