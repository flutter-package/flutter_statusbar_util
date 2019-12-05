import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusbarUtil {
  static const MethodChannel _channel =
      const MethodChannel('statusbar_util');


  static void setTranslucent() {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    _channel.invokeMethod('setTranslucent');
  }
}
