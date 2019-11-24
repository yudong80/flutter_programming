void main() {
  //1. 할당, 산술 연산자
  int num = 99;
  num += 1;
  print('num = $num');

  //2. 관계 연산자
  const double PIE = 3.14;
  if (PIE >= 3) {
    print('PIE는 3 이상이다');
  }

  //3. 논리 연산자
  const String PASSWORD = '1234';
  String _input = '12345';
  if (_input == PASSWORD) {
    print('로그인 성공');
  } else {
    print('비밀 번호를 다시 입력하세요');
  }

  //4. 삼항 연산자
  String _nextInput = '1234';
  String _loginResult = PASSWORD == _nextInput ? '로그인 성공': '비밀번호를 다시 입력하세요';
  print(_loginResult);
}