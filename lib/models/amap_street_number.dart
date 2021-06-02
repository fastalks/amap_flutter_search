import 'package:amap_flutter_search/models/amap_geo_point.dart';
import 'package:json_annotation/json_annotation.dart';
part 'amap_street_number.g.dart';

@JsonSerializable()
class AMapStreetNumber {
  ///街道名称
  String? street;

  ///门牌号
  String? number;

  ///坐标点
  AMapGeoPoint? location;

  ///距离（单位：米）
  int distance = 0;

  ///方向
  String? direction;
  AMapStreetNumber();
  factory AMapStreetNumber.fromJson(Map<String, dynamic> srcJson) =>
      _$AMapStreetNumberFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AMapStreetNumberToJson(this);
}
