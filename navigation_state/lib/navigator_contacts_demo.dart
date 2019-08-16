import 'package:flutter/material.dart';
import 'page_contact_list.dart';

void main() => runApp(NavigatorContactsApp());

class NavigatorContactsApp extends StatelessWidget {
  static const String _title = '주소록 예제';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: ContactListPage(_title),
    );
  }
}