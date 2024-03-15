import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/message_provider.dart';
import 'classes/client.dart';
import 'classes/location.dart';
import 'classes/message.dart';
import 'pages/cruise.dart';
import 'util.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MessageProvider()),
      ],
      child: const WhisperChat(),
    ),
  );
}

class WhisperChat extends StatelessWidget {

  const WhisperChat({super.key});
  static Message message = Message(
    type: bindmsg,
    from: Client(
      range: 0,
      username: 'flut',
      location: Location(lat: 0, long: 1),
    ),
    body: '',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Cruise(
        message: message,
      ),
    );
  }
}
