import 'package:json_annotation/json_annotation.dart';

import 'location.dart';

part 'client.g.dart';

@JsonSerializable(
  explicitToJson: true
)
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

