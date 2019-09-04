import 'package:flutter/material.dart';

const String _defaultStation = '광화문';

class MainPage extends StatefulWidget {
  @override
  State createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  var _stationController = TextEditingController(text: _defaultStation);

  void onClick() {
    print('>> input : ${_stationController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('지하철 실시간 정보'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            child: Row(
              children: <Widget>[
                Text('역 이름'),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 150,
                  child: TextField(
                    controller: _stationController,
                  ),
                ),
                Expanded(
                  child: SizedBox.shrink(),
                ),
                RaisedButton(
                  child: Text('조회'),
                  onPressed: onClick,
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              Text('     도착 정보'),
            ],
          ),
          SizedBox(height: 10,),
          Card(
            child: Container(
              padding: EdgeInsets.all(70),
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 15.0 / 5.0,
                    child: Image.asset('images/subway.png'),
                  ),
                  Text('hello1'),
                  Text('hello2'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
