import 'client.dart';

class Message {
  String type;
  Client from;
  String body;

  Message({
    required this.type, required this.from, required this.body
  });

  factory Message.fromJson(Map<String, dynamic> data) => _$MessageFromJson(data);
  Map<String, dynamic> toJson() => _$MessageToJson(this);

}

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
  type: json['type'] as String,
  from: Client.fromJson(json['from'] as Map<String, dynamic>),
  body: json['body'] as String,
);


Map<String, dynamic> _$MessageToJson(Message message) => <String, dynamic> {
  '"type"': '"${message.type}"',
  '"from"': '${message.from.toJson()}',
  '"body"': '"${message.body}"',
};
