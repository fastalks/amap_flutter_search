// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amap_geo_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AMapGeoPoint _$AMapGeoPointFromJson(Map<String, dynamic> json) {
  return AMapGeoPoint()
    ..latitude = (json['latitude'] as num).toDouble()
    ..longitude = (json['longitude'] as num).toDouble();
}

Map<String, dynamic> _$AMapGeoPointToJson(AMapGeoPoint instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
