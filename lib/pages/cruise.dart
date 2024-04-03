import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../providers/message_provider.dart';
import '../classes/message.dart';
import '../shared/chat_list.dart';
import '../shared/chat_textbox.dart';
import '../shared/image_slider.dart';
import '../util.dart';

class LoadingPage extends StatefulWidget {
  final Message message;
  const LoadingPage({super.key, required this.message});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  final _channel = WebSocketChannel.connect(
    // Uri.parse('ws://localhost:8080'),
    Uri.parse('wss://topical-slightly-weevil.ngrok-free.app'),
  );

  @override
  void initState() {
    _channel.sink.add(widget.message.toJson().toString());
    context.read<MessageProvider>().setSelfUsername(widget.message.from.username);
    super.initState();
  }

  @override
  void dispose() {
    _channel.sink.close();
    context.read<MessageProvider>().deleteAllMessages();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: true,
        onPopInvoked: (pop) {
          _channel.sink.close();
          context.read<MessageProvider>().deleteAllMessages();
        },
        child: StreamBuilder(
          stream: _channel.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(
                      builder: (context) {
                        if (snapshot.hasData) {
                          parseMessage(context, snapshot.data);
                        }
                        return const ChatList();
                      },
                    ),
                    ChatTextBox(channel: _channel),
                  ],
                ),
              );
            }
        
            return const Padding(
              padding: EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageSlider(),
                  SizedBox(
                    height: 20
                  ),
                  Text(
                    'We\'re finding the best match for you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'LobsterTwo',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Hang tight!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Staatliches',
                      fontSize: 20,
                      letterSpacing: 3,
                      color: Colors.blueGrey,
                    ),
                  ),
                  ],
                  ),
                  );
        
          },
          ),
      ),
        );
  }
}
