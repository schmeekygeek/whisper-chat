// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      username: json['username'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      range: json['range'] as int,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'username': instance.username,
      'location': instance.location.toJson(),
      'range': instance.range,
    };
