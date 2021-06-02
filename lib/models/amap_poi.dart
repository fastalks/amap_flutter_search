import 'package:amap_flutter_search/models/amap_geo_point.dart';
import 'package:amap_flutter_search/models/amap_image.dart';
import 'package:amap_flutter_search/models/amap_indoor_data.dart';
import 'package:amap_flutter_search/models/amap_poi_extension.dart';
import 'package:amap_flutter_search/models/amap_subpoi.dart';
import 'package:json_annotation/json_annotation.dart';

part 'amap_poi.g.dart';

@JsonSerializable()
class AMapPOI {
  ///POI全局唯一ID
  String? uid;

  ///名称
  String? name;

  ///兴趣点类型
  String? type;

  ///类型编码
  String? typecode;

  ///经纬度
  AMapGeoPoint? location;

  ///地址
  String? address;

  ///电话
  String? tel;

  ///距中心点的距离，单位米。在周边搜索时有效
  int? distance;

  ///停车场类型，地上、地下、路边
  String? parkingType;

  ///商铺id
  String? shopID;

  ///邮编
  String? postcode;

  ///网址
  String? website;

  ///电子邮件
  String? email;

  ///省
  String? province;

  ///省编码
  String? pcode;

  ///城市名称
  String? city;

  ///城市编码
  String? citycode;

  ///区域名称
  String? district;

  ///区域编码
  String? adcode;

  ///地理格ID
  String? gridcode;

  ///入口经纬度
  AMapGeoPoint? enterLocation;

  ///出口经纬度
  AMapGeoPoint? exitLocation;

  ///方向
  String? direction;

  ///是否有室内地图
  bool? hasIndoorMap;

  ///所在商圈
  String? businessArea;

  ///室内信息
  AMapIndoorData? indoorData;

  ///子POI列表
  List<AMapSubPOI?>? subPOIs;

  ///图片列表
  List<AMapImage?>? images;

  ///扩展信息只有在ID查询时有效
  AMapPOIExtension? extensionInfo;

  AMapPOI();

  factory AMapPOI.fromJson(Map<String, dynamic> srcJson) =>
      _$AMapPOIFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AMapPOIToJson(this);
}
