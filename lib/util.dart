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
  Future.delayed(const Duration(seconds: 1));
  Message message = Message.fromJson(jsonDecode(data));
  context.read<MessageProvider>().addMessage(message);
}
