import 'package:flutter/material.dart';

void main() => runApp(TextDemo());

class TextDemo extends StatelessWidget {
  final String _title = 'Text Widget Demo';
  final String _name = 'Tony';
  final int _age = 28;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: Scaffold(
          appBar: AppBar(title: Text(_title)),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Simple Text"), //simple text FIXME 한글이 안되는데???
              Text(
                'My name is $_name and $_age years old.', //styled text
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0, //dp
                    background: Paint()
                      ..color = Color(0xFFDCEDC8)
                      ..style = PaintingStyle.fill,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'My hobby is coding Flutter. If you have any questions please free free to ask anything about it',
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ));
  }
}
