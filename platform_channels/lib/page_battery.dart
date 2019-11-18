import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(BatteryPage());

class BatteryPage extends StatefulWidget {
  @override
  State createState() => BatteryPageState();
}

class BatteryPageState extends State<BatteryPage> {
  String _text = 'battery level is unknown';

  static const String CHANNEL_BATTERY = 'android/battery';
  static const String METHOD_BATTERY = 'getBatteryLevel';
  static const MethodChannel batteryChannel = MethodChannel(CHANNEL_BATTERY);

  Future<void> _refresh() async {
    print('refresh battery level');

    String _newText;
    try {
      final int result = await batteryChannel.invokeMethod(METHOD_BATTERY);
      _newText = 'battery level is $result %';
    } on PlatformException {
      _newText = 'battery level is unavailable';
    }

    setState(() {
      _text = _newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Battery level',
      home: Scaffold(
        appBar: AppBar(title: Text('Battery Channel')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_text),
              RaisedButton(
                child: Text('Refresh'),
                onPressed: _refresh,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
