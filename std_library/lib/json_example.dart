import 'dart:convert';
import 'dart:io';

void main() {
  //1. JSON 문자열 파싱하기
  String jsonStr = """
  {"basket" : {
    "apple" : 50,
    "banana" : 10,
    "grape" : 5
    }  
  }
  """;
  Map json = jsonDecode(jsonStr);
  Map basket = json["basket"];
  int apples = basket["apple"];
  int bananas = basket["banana"];
  int grapes = basket["grape"];
  print("apples are $apples");
  print("bananas are $bananas");
  print("grapes are $grapes");

  //2. JSON 파일 읽기
  Map basketMap = _readBasketJson('basket.json');
  print('grapes was ${basketMap["grape"]}');

  //3. JSON 파일 쓰기
  basketMap.update('grape', (v) => 99);
  File('basket.json').writeAsStringSync(jsonEncode(basketMap));

  Map updated = _readBasketJson('basket.json');
  int grapesNow = updated["grape"];
  print('now grapes are $grapesNow');
}

Map _readBasketJson(String fileName) {
  String contents = File(fileName).readAsStringSync();
  print('contents : $contents');
  return jsonDecode(contents);
}