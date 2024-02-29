import 'dart:convert';

import 'classes/client.dart';

enum Info { matched, disconnected }

bool isServerMessage(String message) {
  return message.startsWith('msg:');
}

(Info, Client) parseServerMessage(String message) {
  int from = 0;

  for (int i = 0; i < message.length; i++) {
    if (message[i] == ' ') {
      from = i;
      break;
    }
  }

  // msg:MATCHED sntoaehu
  Client client = Client.fromJson(jsonDecode(message.substring(from, message.length)));
  late Info info;
  switch (message.substring(4, from).toLowerCase()) {
    case 'matched':
      info = Info.matched;
    case 'disconnected':
      info = Info.disconnected;
  }
  return (info, client);
}
