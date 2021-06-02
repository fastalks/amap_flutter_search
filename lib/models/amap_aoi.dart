import 'package:amap_flutter_search/models/amap_geo_point.dart';
import 'package:json_annotation/json_annotation.dart';
part 'amap_aoi.g.dart';

@JsonSerializable()
class AMapAOI {
  ///AOI全局唯一ID
  String? uid;

  ///名称
  String? name;

  ///所在区域编码
  String? adcode;

  ///中心点经纬度
  AMapGeoPoint? location;

  ///面积，单位平方米
  double area = 0;

  AMapAOI();
  factory AMapAOI.fromJson(Map<String, dynamic> srcJson) =>
      _$AMapAOIFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AMapAOIToJson(this);
}
