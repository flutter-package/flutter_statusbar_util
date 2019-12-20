import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:statusbar_util/statusbar_util.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  StatusbarUtil.setTranslucent();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('black'),
              onPressed: () {
                StatusbarUtil.setStatusBarFont(FontStyle.black);
              },
            ),
            RaisedButton(
              child: Text('white'),
              onPressed: () {
                StatusbarUtil.setStatusBarFont(FontStyle.white);
              },
            ),
          ],
        ),
      ),
    );
  }
}
