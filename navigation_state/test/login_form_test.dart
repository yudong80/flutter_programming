import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:navigation_state/login_form_demo.dart';

void main() {
  testWidgets("로그인 폼 테스트", (WidgetTester tester) async {
    Key emailKey = Key('email');
    Key passwordKey = Key('password');

    const emailInput = 'tesla@gmail.com';

    //1. 로그인 폼을 실행
    await tester.pumpWidget(loginFormApp);
    expect(find.byKey(emailKey), findsOneWidget);
    expect(find.byKey(passwordKey), findsOneWidget);
    expect(find.widgetWithText(RaisedButton, 'Log In'), findsOneWidget);

    //2. 이메일 입력
    await tester.enterText(find.byKey(emailKey), emailInput);

    //3. 로그인 버튼 누르기
    await tester.tap(find.widgetWithText(RaisedButton, 'Log In'));
    await tester.pumpAndSettle();

    //4. 결과 확인
    expect(find.text('로그인 완료:  ${emailInput}'), findsOneWidget);
  });
}

