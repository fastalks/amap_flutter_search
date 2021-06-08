import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:amap_flutter_search/models/amap_poi.dart';
import 'package:amap_flutter_search/models/amap_regeo_code.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:amap_flutter_search/amap_flutter_search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  AMapFlutterLocation _locationPlugin = new AMapFlutterLocation();
  @override
  void initState() {
    super.initState();
    AMapFlutterLocation.setApiKey(
        "43c85c99e0ccb05317bb857ec593cdc1", "6c33f7d4111cb310890c057a95766004");

    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      platformVersion = await AmapFlutterSearch.platformVersion;
      List<AMapPOI?> pois = await AmapFlutterSearch.poiKeywords('西子国际', '上海');

      AMapReGeocode? regeo =
          await AmapFlutterSearch.reGoecodeSearch(31.15339, 121.494189);
      print("=============");
      print(pois);
      print(regeo?.pois?[0]?.name);
      print(regeo?.pois?[0]?.address);
      print("=============");
    } catch (e) {
      platformVersion = 'error version';
      print("=============");
      print(e);
      print("=============");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
