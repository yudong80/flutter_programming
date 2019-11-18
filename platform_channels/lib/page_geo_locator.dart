import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:geolocator/geolocator.dart';

void main() => runApp(LocationPage());

class LocationPage extends StatefulWidget {
  @override
  State createState() => LocationPageState();
}

class LocationPageState extends State<LocationPage> {
  String _text = 'current location is unknown';

  Future<void> _refresh() async {
    print('refresh current location');

    String _newText;
    try {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      String result = "(${position.latitude}, ${position.longitude})";
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
      title: 'GeoLocator Example',
      home: Scaffold(
        appBar: AppBar(title: Text('GeoLocator Example')),
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
