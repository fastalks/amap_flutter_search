// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amap_address_component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AMapAddressComponent _$AMapAddressComponentFromJson(Map<String, dynamic> json) {
  return AMapAddressComponent()
    ..country = json['country'] as String?
    ..countryCode = json['countryCode'] as String?
    ..province = json['province'] as String?
    ..city = json['city'] as String?
    ..citycode = json['citycode'] as String?
    ..district = json['district'] as String?
    ..adcode = json['adcode'] as String?
    ..township = json['township'] as String?
    ..towncode = json['towncode'] as String?
    ..neighborhood = json['neighborhood'] as String?
    ..building = json['building'] as String?
    ..streetNumber = json['streetNumber'] == null
        ? null
        : AMapStreetNumber.fromJson(
            json['streetNumber'] as Map<String, dynamic>)
    ..businessAreas = (json['businessAreas'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : AMapBusinessArea.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$AMapAddressComponentToJson(
        AMapAddressComponent instance) =>
    <String, dynamic>{
      'country': instance.country,
      'countryCode': instance.countryCode,
      'province': instance.province,
      'city': instance.city,
      'citycode': instance.citycode,
      'district': instance.district,
      'adcode': instance.adcode,
      'township': instance.township,
      'towncode': instance.towncode,
      'neighborhood': instance.neighborhood,
      'building': instance.building,
      'streetNumber': instance.streetNumber,
      'businessAreas': instance.businessAreas,
    };
