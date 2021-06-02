import 'package:amap_flutter_search/models/amap_geo_point.dart';
import 'package:json_annotation/json_annotation.dart';
part 'amap_business_area.g.dart';

@JsonSerializable()
class AMapBusinessArea {
  ///名称
  String? name;

  ///中心坐标
  AMapGeoPoint? location;

  AMapBusinessArea();
  factory AMapBusinessArea.fromJson(Map<String, dynamic> srcJson) =>
      _$AMapBusinessAreaFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AMapBusinessAreaToJson(this);
}
