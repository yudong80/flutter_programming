import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void addNumbers(String key) {
    print('calc key >>' + key);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator', //app name
      home: Scaffold(
          appBar: AppBar(title: Text('Simple Calculator')), //title bar
          body: Column(children: [
            Row(children: [
              RaisedButton(child: Text('7'), onPressed: () { addNumbers('7'); },),
              RaisedButton(child: Text('8'), onPressed: () { addNumbers('8'); },),
              RaisedButton(child: Text('9'), onPressed: () { addNumbers('9'); },),
              RaisedButton(child: Text('X'), onPressed: () { addNumbers('X'); },),
            ]),
            Row(children: [
              RaisedButton(child: Text('4'), onPressed: () { addNumbers('4'); },),
              RaisedButton(child: Text('5'), onPressed: () { addNumbers('5'); },),
              RaisedButton(child: Text('6'), onPressed: () { addNumbers('6'); },),
              RaisedButton(child: Text('-'), onPressed: () { addNumbers('-'); },),
            ]),
            Row(children: [
              RaisedButton(child: Text('1'), onPressed: () { addNumbers('1'); },),
              RaisedButton(child: Text('2'), onPressed: () { addNumbers('2'); },),
              RaisedButton(child: Text('3'), onPressed: () { addNumbers('3'); },),
              RaisedButton(child: Text('+'), onPressed: () { addNumbers('+'); },),
            ]),
            Row(children: [
              RaisedButton(child: Text(' '), onPressed: () { addNumbers(' '); },),
              RaisedButton(child: Text('0'), onPressed: () { addNumbers('0'); },),
              RaisedButton(child: Text('.'), onPressed: () { addNumbers('.'); },),
              RaisedButton(child: Text('='), onPressed: () { addNumbers('='); },),
            ]),
          ])),
    );
  }
}
