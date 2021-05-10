import 'package:amap_flutter_location/amap_flutter_location.dart';
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

    AMapFlutterLocation.setApiKey("xxxxxx", "xxxxxx");

    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    print("======initPlatformState=======");
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await AmapFlutterSearch.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    print(platformVersion);
    try {
      String json = await AmapFlutterSearch.poiKeywords('海阳新村', '上海');
      print("=============");
      print(json);
      print("=============");
    } catch (e) {
      print("=============");
      print(e);
      print("=============");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;

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
