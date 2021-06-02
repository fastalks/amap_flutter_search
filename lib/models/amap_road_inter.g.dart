// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amap_road_inter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AMapRoadInter _$AMapRoadInterFromJson(Map<String, dynamic> json) {
  return AMapRoadInter()
    ..distance = json['distance'] as int
    ..direction = json['direction'] as String?
    ..location = json['location'] == null
        ? null
        : AMapGeoPoint.fromJson(json['location'] as Map<String, dynamic>)
    ..firstId = json['firstId'] as String?
    ..firstName = json['firstName'] as String?
    ..secondId = json['secondId'] as String?
    ..secondName = json['secondName'] as String?;
}

Map<String, dynamic> _$AMapRoadInterToJson(AMapRoadInter instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'direction': instance.direction,
      'location': instance.location,
      'firstId': instance.firstId,
      'firstName': instance.firstName,
      'secondId': instance.secondId,
      'secondName': instance.secondName,
    };
