import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator', //app name
      home: Scaffold(
          appBar: AppBar(title: Text('Simple Calculator')), //title bar
          body: Column(children: [
            Row(children: [
              CalcButton('7'),
              CalcButton('8'),
              CalcButton('9'),
              CalcButton('*'),
            ]),
            Row(children: [
              CalcButton('4'),
              CalcButton('5'),
              CalcButton('6'),
              CalcButton('-'),
            ]),
            Row(children: [
              CalcButton('1'),
              CalcButton('2'),
              CalcButton('3'),
              CalcButton('+'),
            ]),
            Row(children: [
              FuncButton('C'),
              CalcButton('0'),
              CalcButton('/'),
              CalcButton('='),
            ]),
          ])),
    );
  }
}

//계산이 되어야 한다.
const List OPERATORS = ['+', '-', '*', '/'];

String buffer = '';
double op1 = 0;
double op2 = 0;
String operator = '';
void addNumbers(String key) {
  if (key == 'C') {
    buffer = '';
  } else if (OPERATORS.contains(key)) {
    op1 = double.parse(buffer);
    operator = key;
    buffer = '';
  } else if (key == '=') {
    op2 = double.parse(buffer);
    calculate(op1, op2, operator);
    buffer = '';
  } else {
    buffer += key;
  }
}

void calculate(double op1, double op2, String operator) {
  print('op1 : $op1 , op2: $op2 , operator: $operator');
  double res = 0.0;
  if (operator == "+") res = op1 + op2;
  if (operator == "-") res = op1 - op2;
  if (operator == '*') res = op1 * op2;
  if (operator == '/') res = op1 / op2;
  print('result is $res');
}

class CalcButton extends RaisedButton {
  CalcButton(this._key);

  final _key;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(_key),
      onPressed: () {
        addNumbers(_key);
      },
    );
  }
}

class FuncButton extends RaisedButton {
  FuncButton(this._key);

  final _key;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(_key),
      color: Colors.green,
      onPressed: () {
        addNumbers(_key);
      },
    );
  }
}
