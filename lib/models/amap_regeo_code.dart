import 'package:amap_flutter_search/models/amap_address_component.dart';
import 'package:amap_flutter_search/models/amap_aoi.dart';
import 'package:amap_flutter_search/models/amap_poi.dart';
import 'package:amap_flutter_search/models/amap_road.dart';
import 'package:amap_flutter_search/models/amap_road_inter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'amap_regeo_code.g.dart';

@JsonSerializable()
class AMapReGeocode {
  ///格式化地址
  String? formattedAddress;

  ///地址组成要素
  AMapAddressComponent? addressComponent;

  ///道路信息 AMapRoad 数组
  List<AMapRoad?>? roads;

  ///道路路口信息 AMapRoadInter 数组
  List<AMapRoadInter?>? roadinters;

  ///兴趣点信息 AMapPOI 数组
  List<AMapPOI?>? pois;

  ///兴趣区域信息 AMapAOI 数组
  List<AMapAOI?>? aois;

  AMapReGeocode();

  factory AMapReGeocode.fromJson(Map<String, dynamic> srcJson) =>
      _$AMapReGeocodeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AMapReGeocodeToJson(this);
}
