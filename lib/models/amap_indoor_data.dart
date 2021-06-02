import 'package:json_annotation/json_annotation.dart';

part 'amap_indoor_data.g.dart';

@JsonSerializable()
class AMapIndoorData {
  ///楼层，为0时为POI本身
  int? floor;

  ///楼层名称
  String? floorName;

  ///建筑物ID
  String? pid;

  AMapIndoorData();

  factory AMapIndoorData.fromJson(Map<String, dynamic> srcJson) =>
      _$AMapIndoorDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AMapIndoorDataToJson(this);
}
