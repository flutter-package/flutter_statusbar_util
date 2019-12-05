# statusbar_util

A flutter plugin to set statusbar transparent.support android 4.4+ && ios.

## Getting Started

```yaml
dependencies:
    statusbar_util: ^newest
```

## Usage
```dart
import 'package:statusbar_util/statusbar_util.dart';

void main() {
  if (Platform.isAndroid) { // transparent statusbar is default behavior in ios
    StatusbarUtil.setTranslucent();
  }
  runApp(MyApp());
}
```
