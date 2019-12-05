import 'dart:async';

import 'package:flutter/services.dart';

class StatusbarUtil {
  static const MethodChannel _channel =
      const MethodChannel('statusbar_util');


  static void setTranslucent() {
    _channel.invokeMethod('setTranslucent');
  }
  
}
