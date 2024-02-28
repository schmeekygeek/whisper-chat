import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable(
  explicitToJson: true
)
class Location {
  int latitude;
  int longitude;

  Location({
    required this.latitude, required this.longitude
  });

  factory Location.fromJson(Map<String, dynamic> data) => _$LocationFromJson(data);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
