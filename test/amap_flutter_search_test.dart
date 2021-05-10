import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:amap_flutter_search/amap_flutter_search.dart';

void main() {
  const MethodChannel channel = MethodChannel('amap_flutter_search');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await AmapFlutterSearch.platformVersion, '42');
  });
}
