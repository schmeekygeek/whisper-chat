class Location {
  double lat;
  double long;

  Location({
    required this.lat, required this.long
  });

  factory Location.fromJson(Map<String, dynamic> data) => _$LocationFromJson(data);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
  lat: json['lat'] as double,
  long: json['long'] as double,
);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
  '"lat"': instance.lat,
  '"long"': instance.long,
};
