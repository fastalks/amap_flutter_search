// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amap_subpoi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AMapSubPOI _$AMapSubPOIFromJson(Map<String, dynamic> json) {
  return AMapSubPOI()
    ..uid = json['uid'] as String?
    ..name = json['name'] as String?
    ..sname = json['sname'] as String?
    ..location = json['location'] == null
        ? null
        : AMapGeoPoint.fromJson(json['location'] as Map<String, dynamic>)
    ..address = json['address'] as String?
    ..distance = json['distance'] as int?
    ..subtype = json['subtype'] as String?;
}

Map<String, dynamic> _$AMapSubPOIToJson(AMapSubPOI instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'sname': instance.sname,
      'location': instance.location,
      'address': instance.address,
      'distance': instance.distance,
      'subtype': instance.subtype,
    };
