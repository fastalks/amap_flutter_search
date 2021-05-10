import 'dart:async';

import 'package:flutter/services.dart';

class AmapFlutterSearch {
  static const MethodChannel _channel =
      const MethodChannel('amap_flutter_search');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> poiKeywords(String keywords, String city) async {
    final String json = await _channel
        .invokeMethod('poiKeywords', {'keywords': keywords, 'city': city});
    return json;
  }
}