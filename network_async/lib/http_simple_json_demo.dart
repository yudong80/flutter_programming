import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  String url = 'https://jsonplaceholder.typicode.com/todos/1';
  var response = await http.get(url);

  Map<String, dynamic> data = jsonDecode(response.body);
  print('userId : ${data['userId']}');
  print('id : ${data['id']}');
  print('title : ${data['title']}');
  print('complete : ${data['completed']}');
}
