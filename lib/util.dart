import 'dart:convert';

import 'classes/message.dart';

  const matchedmsg = 'matched';
  const bindmsg = 'bind';
  const dscnctmsg = 'disconnected';
  const clntmsg = 'client';

parseMessage(String data) {
  Message message = Message.fromJson(jsonDecode(data));
  switch (message.type) {
    case clntmsg:
  }
}
