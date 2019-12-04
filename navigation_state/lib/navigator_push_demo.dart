import 'package:flutter/material.dart';

void main() => runApp(NavigatorPushDemo());

class NavigatorPushDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
   _showNextPage(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => NextPage()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator 기본 데모'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => _showNextPage(context),
          child: Text('다음 화면으로 이동'),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  _backToMainPage(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('다음 페이지'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => _backToMainPage(context),
          child: Text('돌아가기'),
        ),
      ),
    );
  }
}
