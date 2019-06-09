void main() {
  //1. print 함수 내부 살펴보기
  print('hello');

  //2. 숫자 -> 문자열 변환
  int num1 = 5000;
  double num2 = 360.1234;

  String num1Str = num1.toString();
  String num2Str = num2.toStringAsFixed(2);
  print('num1 to str is $num1Str');
  print('num2 to str is $num2Str');

  //3. 문자 -> 숫자 변환
  List<String> inputs = [
    '-1', //[0]
    '1234', //[1]
    '32.25' //[2]
  ];

  print(int.parse(inputs[0]));
  print(int.parse(inputs[1]));
  print(double.parse(inputs[2]));
  print(num.parse(inputs[2]));
}