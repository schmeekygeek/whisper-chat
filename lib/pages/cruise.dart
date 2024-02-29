import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../classes/client.dart';
import '../util.dart';

class Cruise extends StatefulWidget {
  const Cruise({
    super.key, required this.client
  });

  final Client client;

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
    _channel.sink.add('msg:BIND ${widget.client.toJson().toString()}');
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
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Send a message'),
              ),
            ),
            const SizedBox(height: 24),
            StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData && isServerMessage(snapshot.data)) {
                  late Info info;
                  late Client client;
                  (info, client) = parseServerMessage(snapshot.data);
                  print(info);
                  print(client.username);
                }
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }
}
