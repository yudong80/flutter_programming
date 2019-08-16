import 'package:flutter/material.dart';

void main() => runApp(NavigatorRoutesApp());

const String MAIN_PAGE = '/';
const String DETAIL_PAGE = '/detail';

class NavigatorRoutesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator 경로 데모',
      initialRoute: MAIN_PAGE,
      routes: {
        MAIN_PAGE: (context) => MainPage(),
        DETAIL_PAGE: (context) => DetailPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메인 페이지'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, DETAIL_PAGE);
          },
          child: Text('상세 페이지로 이동'),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상세 페이지'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('메인 페이지로 돌아가기'),
        ),
      ),
    );
  }
}
