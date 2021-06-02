import 'package:amap_flutter_search/models/amap_geo_point.dart';
import 'package:json_annotation/json_annotation.dart';
part 'amap_road_inter.g.dart';

@JsonSerializable()
class AMapRoadInter {
  ///距离（单位：米）
  int distance = 0;

  ///方向
  String? direction;

  ///经纬度
  AMapGeoPoint? location;

  ///第一条道路ID
  String? firstId;

  ///第一条道路名称
  String? firstName;

  ///第二条道路ID
  String? secondId;

  ///第二条道路名称
  String? secondName;

  AMapRoadInter();
  factory AMapRoadInter.fromJson(Map<String, dynamic> srcJson) =>
      _$AMapRoadInterFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AMapRoadInterToJson(this);
}
