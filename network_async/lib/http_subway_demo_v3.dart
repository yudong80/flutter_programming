import 'package:flutter/material.dart';
import 'page_subway_info.dart';

void main() => runApp(SubwayDemo());

class SubwayDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '지하철 실시간 정보',
      home: MainPage(),
    );
  }
}

