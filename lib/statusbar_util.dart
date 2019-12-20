import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusbarUtil {
  static const MethodChannel _channel =
      const MethodChannel('chavesgu/statusbar_util');


  static void setTranslucent() {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    _channel.invokeMethod('setTranslucent');
  }

  static void setStatusBarFont(FontStyle style) {
    String _style = 'black';
    if (style==FontStyle.white) {
      _style = 'white';
    }
    _channel.invokeMethod('setStatusBarFont', <String, dynamic>{
      "style": _style,
    });
  }
}

enum FontStyle {
  black,
  white,
}
