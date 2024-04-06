import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/message_provider.dart';
import '../providers/theme_model.dart';
import '../classes/message.dart';
import '../util.dart';

class ChatChip extends StatelessWidget {
  final Message message;
  const ChatChip({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    bool isSelf = context.read<MessageProvider>().getSelfUsername == message.from.username;
    
    if (message.type == cnnctmsg || message.type == dscnctmsg ) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${message.from.username} ${message.type}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
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
            color: isSelf ? Dark.blue : Dark.text,
            borderRadius: BorderRadius.only(
              topLeft: isSelf ? const Radius.circular(15) : const Radius.circular(0),
              topRight: !isSelf ? const Radius.circular(15) : const Radius.circular(0),
              bottomLeft: const Radius.circular(15),
              bottomRight: const Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.body,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Dark.crust,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  '${DateTime.now().hour}:${DateTime.now().minute}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Dark.surface0,
                    fontSize: 8,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
