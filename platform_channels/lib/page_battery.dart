import 'package:flutter/material.dart';

void main() => runApp(BatteryPage());

class BatteryPage extends StatefulWidget {
  @override
  State createState() => BatteryPageState();
}

class BatteryPageState extends State<BatteryPage> {
  String _text = 'battery level is unknown';

  void _refresh() {
    print('refresh');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Battery level',
      home: Scaffold(
        appBar: AppBar(title: Text('Battery Level')),
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
