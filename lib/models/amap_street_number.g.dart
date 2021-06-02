// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amap_street_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AMapStreetNumber _$AMapStreetNumberFromJson(Map<String, dynamic> json) {
  return AMapStreetNumber()
    ..street = json['street'] as String?
    ..number = json['number'] as String?
    ..location = json['location'] == null
        ? null
        : AMapGeoPoint.fromJson(json['location'] as Map<String, dynamic>)
    ..distance = json['distance'] as int
    ..direction = json['direction'] as String?;
}

Map<String, dynamic> _$AMapStreetNumberToJson(AMapStreetNumber instance) =>
    <String, dynamic>{
      'street': instance.street,
      'number': instance.number,
      'location': instance.location,
      'distance': instance.distance,
      'direction': instance.direction,
    };
