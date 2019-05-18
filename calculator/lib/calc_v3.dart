import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//결과를 화면에 표시
class MyApp extends StatefulWidget {
  @override
  State createState() {
    return MyAppState();
  }
}

typedef bufferFunc = void Function(String key);
const List OPERATORS = ['+', '-', '*', '/'];

class MyAppState extends State<MyApp> {

  double text = 0;
  String buffer = '';
  double op1 = 0;
  double op2 = 0;
  String operator = '';

  void numberPressed(String key) {
    if (key == 'C') {
      buffer = '';
      showResult(0);
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
    showResult(res);
  }

  void showResult(double num) {
    setState(() {
      text = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator', //app name
      home: Scaffold(
          appBar: AppBar(title: Text('Simple Calculator')), //title bar
          body: Column(children: [
            Row(children: [
              CalcButton('7', numberPressed),
              CalcButton('8', numberPressed),
              CalcButton('9', numberPressed),
              CalcButton('*', numberPressed),
            ]),
            Row(children: [
              CalcButton('4', numberPressed),
              CalcButton('5', numberPressed),
              CalcButton('6', numberPressed),
              CalcButton('-', numberPressed),
            ]),
            Row(children: [
              CalcButton('1', numberPressed),
              CalcButton('2', numberPressed),
              CalcButton('3', numberPressed),
              CalcButton('+', numberPressed),
            ]),
            Row(children: [
              FuncButton('C', numberPressed),
              CalcButton('0', numberPressed),
              CalcButton('/', numberPressed),
              CalcButton('=', numberPressed),
            ]),
            Row(children: [
              Text('=> Result is $text'),
            ]),
          ])),
    );
  }
}

class CalcButton extends RaisedButton {
  CalcButton(this._key, this._func);

  final _key;
  final bufferFunc _func;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(_key),
      onPressed: () {
        _func(_key);
      },
    );
  }
}

class FuncButton extends RaisedButton {
  FuncButton(this._key, this._func);

  final _key;
  final bufferFunc _func;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(_key),
      color: Colors.green,
      onPressed: () {
        _func(_key);
      },
    );
  }
}
