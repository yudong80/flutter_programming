import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String _urlPrefix = 'http://swopenapi.seoul.go.kr/api/subway/';
const String _userKey = 'sample';
const String _urlSuffix = '/json/realtimeStationArrival/0/5/';
const String _defaultStation = '광화문';

const int STATUS_OK = 200;

class MainPage extends StatefulWidget {
  @override
  State createState() => MainPageState();
}

class SubwayArrival {
  int _rowNum;
  String _subwayId;
  String _trainLineNm;
  String _subwayHeading;
  String _arvlMsg2;

  SubwayArrival(this._rowNum, this._subwayId, this._trainLineNm,
      this._subwayHeading, this._arvlMsg2);

  int get rowNum => _rowNum;

  String get subwayId => _subwayId;

  String get trainLineNm => _trainLineNm;

  String get subwayHeading => _subwayHeading;

  String get arvlMsg2 => _arvlMsg2;
}

class MainPageState extends State<MainPage> {
  TextEditingController _stationController =
      TextEditingController(text: _defaultStation);
  String _text1 = 'hello';
  String _text2 = 'hello';

  void _onClick() async {
    String station = _stationController.text;
    var response = await http.get(_buildUrl(station));
    String responseBody = response.body;
    print('res >> $responseBody');

    var json = jsonDecode(responseBody);
    Map<String, dynamic> errorMessage = json['errorMessage'];

    if (errorMessage['status'] != STATUS_OK) {
      setState(() {
        final String errMessage = errorMessage['message'];
        _text1 = 'error';
        _text2 = errMessage;
      });
      return;
    }

    List<dynamic> realtimeArrivalList = json['realtimeArrivalList'];
    final int cnt = realtimeArrivalList.length;

    List<SubwayArrival> list = List.generate(cnt, (int i) {
      Map<String, dynamic> item = realtimeArrivalList[i];
      return SubwayArrival(
        item['rowNum'],
        item['subwayId'],
        item['trainLineNm'],
        item['subwayHeading'],
        item['arvlMsg2'],
      );
    });

    SubwayArrival res = list[0];
    setState(() {
      _text1 = res.trainLineNm;
      _text2 = res.arvlMsg2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                  onPressed: _onClick,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Text('     도착 정보'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(70),
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 15.0 / 5.0,
                    child: Image.asset('images/subway.png'),
                  ),
                  Text(_text1),
                  Text(_text2),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

String _buildUrl(String station) {
  StringBuffer sb = StringBuffer();
  sb.write(_urlPrefix);
  sb.write(_userKey);
  sb.write(_urlSuffix);
  sb.write(station);
  return sb.toString();
}
