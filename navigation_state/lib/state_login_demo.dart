import 'package:flutter/material.dart';
import 'page_login.dart';

void main() => runApp(StateLoginDemo());

class StateLoginDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '로그인 폼',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
