void main() {
  //1. 주석 <- 한줄 주석은 슬래시
  /**
   * 여러 줄의 주석
   */
  ///
  /// 여러 줄의 주석 (다른 방법)
  ///

  //2. 변수
  int num1 = 100;
  double num2 = 3.14;
  num num3 = 100;     //num은 정수도 담을 수 있고
  num num4 = 3.14; //실수를 담을 수도 있다

  double sum1 = num1 + num2;
  //int sum2 = num1 + num2;
  print(sum1);

  num sum3 = num3 * num4;
  print(sum3);

  //3. 문자열
  String text = 'Carpe diem, quam minimum credula postero';
  String myName = 'yudong';
  String hello = 'Hello, ${myName}';
  print(text.substring(0, 10));
  print(hello);
}