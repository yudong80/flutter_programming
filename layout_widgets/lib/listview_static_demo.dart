import 'package:flutter/material.dart';

void main() => runApp(ListViewStaticDemo());

class ListViewStaticDemo extends StatelessWidget {
  static const String _title = "정적 ListView 위젯 데모";
  static const List<String> planets = [
    'Mercury',
    'Venus',
    'Earth',
    'Mars',
    'Jupiter',
    'Saturn',
    'Uranus',
    'Neptune',
    'Pluto',
  ];

  Widget _buildStaticListView() {
    return ListView.builder(
      itemCount: planets.length,
      itemBuilder: (BuildContext _context, int i) {
        return ListTile(
          title: Text(planets[i],
              style: TextStyle(
                fontSize: 23,
              )),
          trailing: Icon(
            Icons.favorite_border,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text(_title)),
          body: _buildStaticListView(),
        ));
  }
}
