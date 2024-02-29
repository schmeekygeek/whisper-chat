import 'location.dart';

class Client {
  String username;
  Location location;
  int range;

  Client({
    required this.username, required this.location, required this.range,
  });

  factory Client.fromJson(Map<String, dynamic> data) => _$ClientFromJson(data);
  Map<String, dynamic> toJson() => _$ClientToJson(this);
}

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
  username: json['username'] as String,
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  range: json['range'] as int,
);

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
  '"username"': '"${instance.username}"',
  '"location"': '${instance.location.toJson()}',
  '"range"': '${instance.range}',
};
