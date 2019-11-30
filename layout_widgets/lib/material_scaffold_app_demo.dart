import 'package:flutter/material.dart';

void main() => runApp(MaterialScaffoldApp());

class MaterialScaffoldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '머터리얼 앱',
      home: Scaffold(
        appBar: AppBar(title: Text('진짜 머터리얼 앱')),
        body: Text('이제야 재대로 된 머터리얼 앱입니다.'),
      ),
    );
  }
}
