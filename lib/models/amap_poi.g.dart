// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amap_poi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AMapPOI _$AMapPOIFromJson(Map<String, dynamic> json) {
  return AMapPOI()
    ..uid = json['uid'] as String?
    ..name = json['name'] as String?
    ..type = json['type'] as String?
    ..typecode = json['typecode'] as String?
    ..location = json['location'] == null
        ? null
        : AMapGeoPoint.fromJson(json['location'] as Map<String, dynamic>)
    ..address = json['address'] as String?
    ..tel = json['tel'] as String?
    ..distance = json['distance'] as int?
    ..parkingType = json['parkingType'] as String?
    ..shopID = json['shopID'] as String?
    ..postcode = json['postcode'] as String?
    ..website = json['website'] as String?
    ..email = json['email'] as String?
    ..province = json['province'] as String?
    ..pcode = json['pcode'] as String?
    ..city = json['city'] as String?
    ..citycode = json['citycode'] as String?
    ..district = json['district'] as String?
    ..adcode = json['adcode'] as String?
    ..gridcode = json['gridcode'] as String?
    ..enterLocation = json['enterLocation'] == null
        ? null
        : AMapGeoPoint.fromJson(json['enterLocation'] as Map<String, dynamic>)
    ..exitLocation = json['exitLocation'] == null
        ? null
        : AMapGeoPoint.fromJson(json['exitLocation'] as Map<String, dynamic>)
    ..direction = json['direction'] as String?
    ..hasIndoorMap = json['hasIndoorMap'] as bool?
    ..businessArea = json['businessArea'] as String?
    ..indoorData = json['indoorData'] == null
        ? null
        : AMapIndoorData.fromJson(json['indoorData'] as Map<String, dynamic>)
    ..subPOIs = (json['subPOIs'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : AMapSubPOI.fromJson(e as Map<String, dynamic>))
        .toList()
    ..images = (json['images'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : AMapImage.fromJson(e as Map<String, dynamic>))
        .toList()
    ..extensionInfo = json['extensionInfo'] == null
        ? null
        : AMapPOIExtension.fromJson(
            json['extensionInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AMapPOIToJson(AMapPOI instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'type': instance.type,
      'typecode': instance.typecode,
      'location': instance.location,
      'address': instance.address,
      'tel': instance.tel,
      'distance': instance.distance,
      'parkingType': instance.parkingType,
      'shopID': instance.shopID,
      'postcode': instance.postcode,
      'website': instance.website,
      'email': instance.email,
      'province': instance.province,
      'pcode': instance.pcode,
      'city': instance.city,
      'citycode': instance.citycode,
      'district': instance.district,
      'adcode': instance.adcode,
      'gridcode': instance.gridcode,
      'enterLocation': instance.enterLocation,
      'exitLocation': instance.exitLocation,
      'direction': instance.direction,
      'hasIndoorMap': instance.hasIndoorMap,
      'businessArea': instance.businessArea,
      'indoorData': instance.indoorData,
      'subPOIs': instance.subPOIs,
      'images': instance.images,
      'extensionInfo': instance.extensionInfo,
    };
