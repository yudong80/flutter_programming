import 'package:flutter/material.dart';

void main() => runApp(NavigatorBasicDemo());

class NavigatorBasicDemo extends StatelessWidget {
  static const String _title = 'Navigator 기본 데모';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: MainPage(_title),
    );
  }
}

class MainPage extends StatelessWidget {
  final String _title;

  MainPage(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondPage()));
          },
          child: Text('다음 화면으로 이동'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('두번째 페이지'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('돌아가기'),
        ),
      ),
    );
  }
}
