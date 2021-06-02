import 'package:amap_flutter_search/models/amap_geo_point.dart';
import 'package:json_annotation/json_annotation.dart';
part 'amap_road.g.dart';

@JsonSerializable()
class AMapRoad {
  ///道路ID
  String? uid;

  ///道路名称
  String? name;

  ///距离（单位：米）
  int distance = 0;

  ///方向
  String? direction;

  ///坐标点
  AMapGeoPoint? location;
  AMapRoad();
  factory AMapRoad.fromJson(Map<String, dynamic> srcJson) =>
      _$AMapRoadFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AMapRoadToJson(this);
}
