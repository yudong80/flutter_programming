import 'dart:io';

void main() {
  //1. 사용자 입력 받기
  stdout.write('Enter name? '); //same as print()
  String input = stdin.readLineSync();
  print('Hello, $input');
}