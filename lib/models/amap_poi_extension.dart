import 'package:json_annotation/json_annotation.dart';

part 'amap_poi_extension.g.dart';

@JsonSerializable()
class AMapPOIExtension {
  ///评分
  double rating = 0;

  ///人均消费
  double cost = 0;

  ///营业时间
  String? openTime;

  AMapPOIExtension();

  factory AMapPOIExtension.fromJson(Map<String, dynamic> srcJson) =>
      _$AMapPOIExtensionFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AMapPOIExtensionToJson(this);
}
