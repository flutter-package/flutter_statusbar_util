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
  // setTranslucent
  StatusbarUtil.setTranslucent();
  
  // setStatusBarFontStyle
  StatusbarUtil.setStatusBarFont(FontStyle.black); // black text
  StatusbarUtil.setStatusBarFont(FontStyle.white); // white text
  runApp(MyApp());
}
```
