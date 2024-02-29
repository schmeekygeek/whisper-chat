class Location {
  int lat;
  int long;

  Location({
    required this.lat, required this.long
  });

  factory Location.fromJson(Map<String, dynamic> data) => _$LocationFromJson(data);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
  lat: json['lat'] as int,
  long: json['long'] as int,
);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
  '"lat"': instance.lat,
  '"long"': instance.long,
};
