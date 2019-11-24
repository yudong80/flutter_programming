import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page_login.dart';
import 'page_main.dart';
import 'state_simple.dart';

void main() => runApp(loginFormApp);

var loginFormApp = ChangeNotifierProvider(
  builder: (context) => SimpleState(),
  child: StateLoginDemo(),
);

const String ROOT_PAGE = '/';
const String MAIN_PAGE = '/main';

class StateLoginDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '로그인 폼',
      debugShowCheckedModeBanner: false,
      initialRoute: ROOT_PAGE,
      routes: {
        ROOT_PAGE : (context) => LoginPage(),
        MAIN_PAGE: (context) => MainPage(),
      },
    );
  }
}