import 'package:amap_flutter_search/models/amap_business_area.dart';
import 'package:amap_flutter_search/models/amap_street_number.dart';
import 'package:json_annotation/json_annotation.dart';
part 'amap_address_component.g.dart';

@JsonSerializable()
class AMapAddressComponent {
  ///国家（since 5.7.0）
  String? country;

  ///国家简码（since 7.4.0）仅海外生效
  String? countryCode;

  ///省/直辖市
  String? province;

  ///市
  String? city;

  ///城市编码
  String? citycode;

  ///区
  String? district;

  ///区域编码
  String? adcode;

  ///乡镇街道
  String? township;

  ///乡镇街道编码
  String? towncode;

  ///社区
  String? neighborhood;

  ///建筑
  String? building;

  ///门牌信息
  AMapStreetNumber? streetNumber;

  ///商圈列表 AMapBusinessArea 数组
  List<AMapBusinessArea?>? businessAreas;

  AMapAddressComponent();

  factory AMapAddressComponent.fromJson(Map<String, dynamic> srcJson) =>
      _$AMapAddressComponentFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AMapAddressComponentToJson(this);
}
