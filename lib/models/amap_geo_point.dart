import 'package:json_annotation/json_annotation.dart';

part 'amap_geo_point.g.dart';

@JsonSerializable()
class AMapGeoPoint {
  ///纬度（垂直方向）
  double latitude = 0;

  ///经度（水平方向）
  double longitude = 0;

  AMapGeoPoint();

  factory AMapGeoPoint.fromJson(Map<String, dynamic> srcJson) =>
      _$AMapGeoPointFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AMapGeoPointToJson(this);
}
