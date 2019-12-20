import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:statusbar_util/statusbar_util.dart';

void main() {
  const MethodChannel channel = MethodChannel('statusbar_util');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
