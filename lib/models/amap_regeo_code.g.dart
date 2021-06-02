// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amap_regeo_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AMapReGeocode _$AMapReGeocodeFromJson(Map<String, dynamic> json) {
  return AMapReGeocode()
    ..formattedAddress = json['formattedAddress'] as String?
    ..addressComponent = json['addressComponent'] == null
        ? null
        : AMapAddressComponent.fromJson(
            json['addressComponent'] as Map<String, dynamic>)
    ..roads = (json['roads'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : AMapRoad.fromJson(e as Map<String, dynamic>))
        .toList()
    ..roadinters = (json['roadinters'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : AMapRoadInter.fromJson(e as Map<String, dynamic>))
        .toList()
    ..pois = (json['pois'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : AMapPOI.fromJson(e as Map<String, dynamic>))
        .toList()
    ..aois = (json['aois'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : AMapAOI.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$AMapReGeocodeToJson(AMapReGeocode instance) =>
    <String, dynamic>{
      'formattedAddress': instance.formattedAddress,
      'addressComponent': instance.addressComponent,
      'roads': instance.roads,
      'roadinters': instance.roadinters,
      'pois': instance.pois,
      'aois': instance.aois,
    };
