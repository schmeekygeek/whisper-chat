import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';

import 'providers/misc_provider.dart';
import 'pages/takeoff.dart';
import 'providers/theme_model.dart';
import 'providers/message_provider.dart';
import 'classes/client.dart';
import 'classes/location.dart';
import 'classes/message.dart';
import 'util.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
        ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MessageProvider()),
        ChangeNotifierProvider(create: (_) => MiscProvider()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
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
      theme: ThemeModel.buildDarkTheme(),
      home: const Takeoff(),
    );
  }
}
