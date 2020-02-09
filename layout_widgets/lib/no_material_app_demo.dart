import 'package:flutter/widgets.dart';

void main() => runApp(NoMaterialApp());

class NoMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text('이것은 머티리얼 앱이 아닙니다.',
        textDirection: TextDirection.ltr,
      ),
    );
  }
}