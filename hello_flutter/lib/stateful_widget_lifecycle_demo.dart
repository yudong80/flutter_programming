import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Stateful 위젯 데모',
      home: Scaffold(
        appBar: AppBar(title: Text('Stateful 위젯 데모')),
        body: _MyStatefulWidget(),
      ),
    ));

class _MyStatefulWidget extends StatefulWidget {
  @override
  State createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<_MyStatefulWidget> {
  String _buttonState;

  @override
  void initState() {
    super.initState();
    print('initState(): 기본값을 설정합니다.');
    _buttonState = 'OFF';
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies() 호출됨');
  }

  @override
  Widget build(BuildContext context) {
    print('build() 호출됨');
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('버튼을 누르세요'),
          onPressed: _onClick,
        ),
        Row(
          children: <Widget>[
            Text('버튼 상태: '),
            Text(_buttonState),
          ],
        )
      ],
    );
  }

  void _onClick() {
    print('_onClick() 호출됨');
    setState(() {
      print('setState() 호출됨');
      if (_buttonState == 'OFF') {
        _buttonState = 'ON';
      } else {
        _buttonState = 'OFF';
      }
    });
  }

  @override
  void didUpdateWidget(_MyStatefulWidget oldWidget) {
    print('didUpdateWidget()');
  }

  @override
  void deactivate() {
    print('deactivate()');
  }

  @override
  void dispose() {
    print('dispose()');
  }
}
