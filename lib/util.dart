import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whisper_chat/providers/message_provider.dart';

import 'classes/message.dart';

const matchedmsg = 'matched';
const bindmsg = 'bind';
const dscnctmsg = 'disconnected';
const clntmsg = 'client';

parseMessage(BuildContext context, String data) {
  Message message = Message.fromJson(jsonDecode(data));
  print(message.type);
  switch (message.type) {
    case clntmsg:
      context.read<MessageProvider>().addMessage(message);
  }
}
