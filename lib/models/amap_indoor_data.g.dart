// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amap_indoor_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AMapIndoorData _$AMapIndoorDataFromJson(Map<String, dynamic> json) {
  return AMapIndoorData()
    ..floor = json['floor'] as int?
    ..floorName = json['floorName'] as String?
    ..pid = json['pid'] as String?;
}

Map<String, dynamic> _$AMapIndoorDataToJson(AMapIndoorData instance) =>
    <String, dynamic>{
      'floor': instance.floor,
      'floorName': instance.floorName,
      'pid': instance.pid,
    };
