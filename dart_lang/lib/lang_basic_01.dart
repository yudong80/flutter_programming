void main() {
  //1. comments <- single line comment
  /**
   * multi line comments
   */
  ///
  /// another multi line comments
  ///

  //2. variables
  int number1 = 100;
  double number2 = 3.14;
  num number3 = 500;
  num number4 = 1000.33;

  var sum = number1 + number2;
  print(sum);

  var sum2 = number3 * number4;
  print(sum2);

  //3. Strings
  String text = 'Carpe diem, quam minimum credula postero';
  print(text.substring(0, 10));
}