import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Cruise extends StatelessWidget {
  const Cruise({super.key});

  static final channel = WebSocketChannel.connect(
    Uri.parse('ws://localhost:8080/chat'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          return Text(snapshot.hasData ? '${snapshot.data}' : '');
        },
      ),
    );
  }
}
