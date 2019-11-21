import 'package:flutter/material.dart';

void main() => runApp(ImageDemo());

class ImageDemo extends StatelessWidget {
  static const String _title = "Image 위젯 데모";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text(_title)),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/london.jpg'),
              Image.asset('assets/autumn-leaves.jpg'),
            ],
          ),
        )
    );
  }
}
