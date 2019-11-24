import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:navigation_state/login_form_demo.dart';
import 'package:navigation_state/page_login.dart';

void main() {
  testWidgets('테스트', (WidgetTester tester) async {

  });

  testWidgets("로그인 폼 테스트", (WidgetTester tester) async {
    //1. 로그인 페이지 실행
    await tester.pumpWidget(StateLoginDemo());

    await tester.enterText(find.widgetWithText(TextFormField, 'your_name@gmail.com'), 'teslar@gmail.com');

//    await tester.tap(find.widgetWithText(RaisedButton, 'Log In'));

  });
}