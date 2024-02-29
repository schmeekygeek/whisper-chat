import 'client.dart';

class Message {
  Client from;
  String body;

  Message({
    required this.from, required this.body
  });

  factory Message.fromJson(Map<String, dynamic> data) => _$MessageFromJson(data);
  Map<String, dynamic> toJson() => _$MessageToJson(this);

}

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
  from: Client.fromJson(json['from'] as Map<String, dynamic>),
  body: json['body'] as String,
);


Map<String, dynamic> _$MessageToJson(Message message) => <String, dynamic> {
  '"from"': '${message.from.toJson()}',
  '"body"': message.body,
};
