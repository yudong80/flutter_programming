import 'atm_v1.dart'; //Account 클래스 임포트

void main() {
  //1. 타입 테스트 연산자
  var account = Account('111-222-33-01', 50000);
  if (account is Account) {
    String name = account.accountNumber;
    int amount = (account as Account).balance; //불필요한 캐스팅
    print('account name is $name , amount is $amount');
  }

  //2. if null 연산자
  String loginAccount = null;
  String playerName = loginAccount ?? 'Guest';
  print('Login Player is $playerName');

  //3. 캐스케이드 연산자
  Account account2 = Account('222-333-33-01', 60000)
    ..deposit(5000)
    ..transfer(account, 10000)
    ..withdraw(5000);
  print('account 2 balance is ${account2.balance}');

  //4. 조건적 맴버 접근 연산자
  Account account3 = null;
  print('account 3 is ${account3?.accountNumber}');
}
