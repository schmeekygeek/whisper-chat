import 'package:flutter/material.dart';

import 'classes/client.dart';
import 'classes/location.dart';
import 'classes/message.dart';
import 'pages/cruise.dart';
import 'util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  static Message message = Message(
    type: MessageType.bind.name,
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
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Cruise(
        message: message,
      ),
    );
  }
}
