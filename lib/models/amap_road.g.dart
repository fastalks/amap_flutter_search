// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amap_road.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AMapRoad _$AMapRoadFromJson(Map<String, dynamic> json) {
  return AMapRoad()
    ..uid = json['uid'] as String?
    ..name = json['name'] as String?
    ..distance = json['distance'] as int
    ..direction = json['direction'] as String?
    ..location = json['location'] == null
        ? null
        : AMapGeoPoint.fromJson(json['location'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AMapRoadToJson(AMapRoad instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'distance': instance.distance,
      'direction': instance.direction,
      'location': instance.location,
    };
