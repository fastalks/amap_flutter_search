// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amap_poi_extension.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AMapPOIExtension _$AMapPOIExtensionFromJson(Map<String, dynamic> json) {
  return AMapPOIExtension()
    ..rating = (json['rating'] as num).toDouble()
    ..cost = (json['cost'] as num).toDouble()
    ..openTime = json['openTime'] as String?;
}

Map<String, dynamic> _$AMapPOIExtensionToJson(AMapPOIExtension instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'cost': instance.cost,
      'openTime': instance.openTime,
    };
