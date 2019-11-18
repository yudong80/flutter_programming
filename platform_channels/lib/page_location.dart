import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(BatteryPage());

class BatteryPage extends StatefulWidget {
  @override
  State createState() => BatteryPageState();
}

class BatteryPageState extends State<BatteryPage> {
  String _text = 'current location is unknown';

  static const String METHOD_CURRENT_LOCATION = "getCurrentLocation";
  static const String CHANNEL_LOCATION = "android/location";
  static const MethodChannel locationChannel = MethodChannel(CHANNEL_LOCATION);

  Future<void> _refresh() async {
    print('refresh current location');

    String _newText;
    try {
      final String result = await locationChannel.invokeMethod(METHOD_CURRENT_LOCATION);
      _newText = 'current location is $result ';
    } on PlatformException {
      _newText = 'current location is unavailable';
    }

    setState(() {
      _text = _newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Current Location',
      home: Scaffold(
        appBar: AppBar(title: Text('Location')),
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
