import 'package:test/test.dart';
import 'package:dart_lang/atm_v2.dart';

void main() {
  test('계좌인출: 잔액보다 큰 금액을 인출하면 안된다', () {
    Account account = Account('111-222', 5000);
    int orgBalance = account.balance;

    account.withdraw(orgBalance + 1);
    expect(account.balance, equals(orgBalance));
  });

  test('계좌입금: 음수의 금액을 입금하면 안된다', () {
    const int orgBalance = 5000;
    Account account = Account('111-222', orgBalance)..deposit(-1);

    expect(orgBalance, equals(account.balance));
  });
}
