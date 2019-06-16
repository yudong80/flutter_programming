import 'dart:io';

void main() {
  //1. 새로운 파일 생성하기
  File newFile = File('temp_file.txt');
  newFile.createSync();

  //2. 파일을 읽기 (동기방식)
  File poem = File('poem.txt');
  List<String> lines = poem.readAsLinesSync();
  for (String line in lines) {
    print(line);
  }

  //3. 파일을 쓰기 (동기방식)
  File memoFile = File('diary.txt');
  String contents = """
2019.06.16: 플러터 공부 시작  
    
오늘은 플러터의 표준 라이브러리를 공부했다. 
안드로이드 스튜디오를 활용하여 예제를 실행하였다.
""";
  memoFile.writeAsStringSync(contents);
}