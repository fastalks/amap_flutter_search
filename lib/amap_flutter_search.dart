import 'dart:async';
import 'dart:convert';

import 'package:amap_flutter_search/models/amap_poi.dart';
import 'package:amap_flutter_search/models/amap_regeo_code.dart';
import 'package:flutter/services.dart';

class AmapFlutterSearch {
  static const MethodChannel _channel =
      const MethodChannel('amap_flutter_search');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// 获取POI信息
  /// @keywords 关键字
  /// @city 城市 cityname or citycode
  static Future<List<AMapPOI?>> poiKeywords(
      String keywords, String city) async {
    List<AMapPOI?> pois = [];
    try {
      final String poisJsonStr = await _channel
          .invokeMethod('poiKeywords', {'keywords': keywords, 'city': city});
      final List<Map<String, dynamic>> poisJson =
          jsonDecode(poisJsonStr).cast<Map<String, dynamic>>();
      poisJson.forEach((e) {
        AMapPOI item = AMapPOI.fromJson(e);
        pois.add(item);
      });
    } catch (e) {
      print('poiKeywords error => %s' + e.toString());
    }

    return pois;
  }

  /// 逆地理编码
  static Future<AMapReGeocode?> reGoecodeSearch(
      double latitude, double longitude) async {
    try {
      final String reGeoJsonStr = await _channel.invokeMethod(
          'reGoecodeSearch', {'latitude': latitude, 'longitude': longitude});
      final Map<String, dynamic> srcJson = jsonDecode(reGeoJsonStr);
      AMapReGeocode reGeo = AMapReGeocode.fromJson(srcJson);
      return reGeo;
    } catch (e) {
      print('reGoecodeSearch error => %s' + e.toString());
    }
  }
}
