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

  // AMapFlutterLocation _locationPlugin = new AMapFlutterLocation();
  @override
  void initState() {
    super.initState();
    AMapFlutterLocation.setApiKey(
        "e300c95e81dbe1b40593ace788992973", "aea7b871e8b43d447d6f870bdaa45929");

    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    try {
      List<AMapPOI?> pois = await AmapFlutterSearch.poiKeywords('海阳新村', '上海');

      AMapReGeocode? regeo =
          await AmapFlutterSearch.reGoecodeSearch(31.15339, 121.494189);
      print("=============");
      // print(pois);
      print(regeo?.pois?[0]?.name);
      print(regeo?.pois?[0]?.address);
      print("=============");
    } catch (e) {
      print("=============");
      print(e);
      print("=============");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
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
