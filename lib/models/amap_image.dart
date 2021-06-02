import 'package:json_annotation/json_annotation.dart';

part 'amap_image.g.dart';

@JsonSerializable()
class AMapImage {
  ///标题
  String? title;

  ///url
  String? url;

  AMapImage();

  factory AMapImage.fromJson(Map<String, dynamic> srcJson) =>
      _$AMapImageFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AMapImageToJson(this);
}
