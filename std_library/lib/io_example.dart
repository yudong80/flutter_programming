import 'dart:io';

void main() {
  //1. 사용자 입력 받기
  stdout.write('Enter name? '); //same as print()
  String input = stdin.readLineSync();
  print('Hello, $input');

  //2. 새로운 파일 생성하기
  File newFile = File('new_file.txt');
  newFile.createSync();
  //newFile.create(); //ch.5 비동기 프로그래밍

  //3. 파일을 읽기



  //4. 파일을 쓰기

}