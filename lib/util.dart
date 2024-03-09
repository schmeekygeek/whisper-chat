import 'dart:convert';

import 'classes/message.dart';

enum MessageType { bind, matched, disconnected, client }

bool isServerMessage(String data) {
  Message message = Message.fromJson(jsonDecode(data));
  return message.type != MessageType.client.toString();
}

(String, String) parseServerMessage(String data) {
  // TODO: parse json body
  Message message = Message.fromJson(jsonDecode(data));
}

Message parseClientMessage(String message){
  return Message.fromJson(jsonDecode(message));
}
