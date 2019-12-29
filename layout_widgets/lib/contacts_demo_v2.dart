import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(ListViewDynamicApp());

class ListViewDynamicApp extends StatelessWidget {
  static const String _title = "주소록 데모 V2";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text(_title)),
          body: ContactListPage(),
        ));
  }
}

class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  Iterable<Contact> _contacts;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  _checkPermissions() async {
    await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
    _refreshContacts();
  }

  _refreshContacts() async {
    Iterable<Contact> contacts =
        await ContactsService.getContacts(withThumbnails: false);
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _contacts != null
        ? ListView.builder(itemCount: _contacts.length, itemBuilder: _buildRow)
        : Center(child: CircularProgressIndicator());
  }

  Widget _buildRow(BuildContext context, int i) {
    Contact c = _contacts.elementAt(i);
    return ListTile(
      leading: (c.avatar != null && c.avatar.length > 0)
          ? CircleAvatar(backgroundImage: MemoryImage(c.avatar))
          : CircleAvatar(child: Text(c.initials())),
      title: Text(c.displayName ?? ""),
    );
  }
}
