import 'package:test/test.dart';
import 'package:dart_lang/atm_v1.dart';

void main() {
  test('계좌 생성 테스트', () {
    String accountName = '117-123-1';
    int amount = 20000;

    Account account = Account(accountName, amount);

    expect(account.accountNumber, equals(accountName));
    expect(account.balance, equals(amount));
  });

  test('계좌 인출 테스트', () {
    String accountName = '117-123-1';
    int amount = 20000;
    int withdraw = 7000;

    Account account = Account(accountName, amount);
    account.withdraw(withdraw);

    expect(account.balance, equals(amount - withdraw));
  });

  test('계좌 입금 테스트', () {
    String accountName = '117-123-1';
    int amount = 20000;
    int deposit = 7000;

    Account account = Account(accountName, amount);
    account.deposit(deposit);

    expect(account.balance, equals(amount + deposit));
  });

  test('계좌 이체 테스트', () {
    Account account1 = Account('117-123-1', 20000);
    Account account2 = Account('117-123-2', 5000);

    account1.transfer(account2, 5000);

    expect(account1.balance, equals(20000 - 5000));
    expect(account2.balance, equals(5000 + 5000));
  });
}
