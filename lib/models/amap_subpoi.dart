import 'package:amap_flutter_search/models/amap_geo_point.dart';
import 'package:json_annotation/json_annotation.dart';
part 'amap_subpoi.g.dart';

@JsonSerializable()
class AMapSubPOI {
  ///POI全局唯一ID
  String? uid;

  ///名称
  String? name;

  ///名称简写
  String? sname;

  ///经纬度
  AMapGeoPoint? location;

  ///地址
  String? address;

  ///距中心点距离
  int? distance;

  ///子POI类型
  String? subtype;

  AMapSubPOI();

  factory AMapSubPOI.fromJson(Map<String, dynamic> srcJson) =>
      _$AMapSubPOIFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AMapSubPOIToJson(this);
}
