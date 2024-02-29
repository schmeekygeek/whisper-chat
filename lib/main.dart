import 'package:flutter/material.dart';

import 'classes/client.dart';
import 'classes/location.dart';
import 'pages/cruise.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Cruise(
        client: Client(username: 'Sam', location: Location(lat: 1, long: 2), range: 3)
      ),
    );
  }
}
