// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amap_aoi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AMapAOI _$AMapAOIFromJson(Map<String, dynamic> json) {
  return AMapAOI()
    ..uid = json['uid'] as String?
    ..name = json['name'] as String?
    ..adcode = json['adcode'] as String?
    ..location = json['location'] == null
        ? null
        : AMapGeoPoint.fromJson(json['location'] as Map<String, dynamic>)
    ..area = (json['area'] as num).toDouble();
}

Map<String, dynamic> _$AMapAOIToJson(AMapAOI instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'adcode': instance.adcode,
      'location': instance.location,
      'area': instance.area,
    };
