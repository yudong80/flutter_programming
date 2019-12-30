import 'package:flutter/material.dart';

void main() => runApp(BatteryPage());

class BatteryPage extends StatefulWidget {
  @override
  State createState() => BatteryPageState();
}

class BatteryPageState extends State<BatteryPage> {
  _refresh() {
    print('refresh battery level');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '배터리 채널 데모 V1',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('배터리 채널 데모 V1')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('배터리 잔량: 모름'),
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