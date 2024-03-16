import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:whisper_chat/providers/message_provider.dart';
import 'package:whisper_chat/shared/chat_list.dart';
import 'package:whisper_chat/shared/chat_textbox.dart';

import '../classes/message.dart';
import '../util.dart';

class Cruise extends StatefulWidget {
  const Cruise({
    super.key, required this.message
  });

  final Message message;

  @override
  State<Cruise> createState() => _CruiseState();
}

class _CruiseState extends State<Cruise> {
  final TextEditingController _controller = TextEditingController();

  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://localhost:8080'),
  );

  @override
  void initState() {
    _channel.sink.add(widget.message.toJson().toString());
    context.read<MessageProvider>().setSelfUsername(widget.message.from.username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  parseMessage(context, snapshot.data);
                }
                return const ChatList();
              },
            ),
            ChatTextBox(channel: _channel),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }
}
