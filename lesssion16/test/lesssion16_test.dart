import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lesssion16/lesssion16.dart';

void main() {
  const MethodChannel channel = MethodChannel('lesssion16');

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
    var Lesssion16;
    expect(await Lesssion16.platformVersion, '42');
  });
}
