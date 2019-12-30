import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(LocationPage());

class LocationPage extends StatefulWidget {
  @override
  State createState() => LocationPageState();
}

class LocationPageState extends State<LocationPage> {
  String _text = '현재 위치: 모름';

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  _checkPermissions() async {
    await PermissionHandler().requestPermissions([PermissionGroup.location]);
  }

  _refresh() async {
    print('refresh current location');

    String _newText;
    try {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      String result = "(${position.latitude}, ${position.longitude})";
      _newText = '현재 위치는 $result ';
    } on PlatformException {
      _newText = '현재 위치를 사용할 수 없습니다.';
    }

    setState(() {
      _text = _newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '현재 위치 채널 데모 V2',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('현재 위치 채널 데모 V2')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_text),
              RaisedButton(
                child: Text('가져오기'),
                onPressed: _refresh,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
