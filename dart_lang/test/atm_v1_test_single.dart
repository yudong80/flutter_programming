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
}