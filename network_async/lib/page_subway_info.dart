import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/subway_arrival.dart';
import 'api/subway_api.dart' as api;


class MainPage extends StatefulWidget {
  @override
  State createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  TextEditingController _stationController =
      TextEditingController(text: api.defaultStation);
  List<SubwayArrival> _data = [];

  List<Card> _buildCards() {
    print('>>> _data.length? ${_data.length}');

    if (_data.length == 0) {
      return <Card>[];
    }

    List<Card> res = [];
    for (SubwayArrival info in _data) {
      Card card = Card(
        child: Column(
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              child: Image.asset('images/subway.png'),
            ),
            Text(info.trainLineNm),
            Text(info.arvlMsg2),
          ],
        ),
      );
      res.add(card);
    }

    return res;
  }

  void _onClick() async {
    String station = _stationController.text;
    var response = await http.get(api.buildUrl(station));
    String responseBody = response.body;
    print('res >> $responseBody');

    var json = jsonDecode(responseBody);
    Map<String, dynamic> errorMessage = json['errorMessage'];

    if (errorMessage['status'] != api.STATUS_OK) {
      setState(() {
        final String errMessage = errorMessage['message'];
        print('error >> $errMessage');
        _data = const [];
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

    setState(() {
      _data = list;
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
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              children: _buildCards(),
            ),
          ),
        ],
      ),
    );
  }
}
