// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amap_business_area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AMapBusinessArea _$AMapBusinessAreaFromJson(Map<String, dynamic> json) {
  return AMapBusinessArea()
    ..name = json['name'] as String?
    ..location = json['location'] == null
        ? null
        : AMapGeoPoint.fromJson(json['location'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AMapBusinessAreaToJson(AMapBusinessArea instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
    };
