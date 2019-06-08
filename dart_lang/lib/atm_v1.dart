void main() {
  //1. 계좌 생성
  Account account1 = new Account("117-123-1", 20000);
  Account account2 = new Account("117-123-2", 5000);

  //2. 잔고 확인
  print('account1 has ${account1.balance} won');
  print('account2 has ${account2.balance} won');

  //3. 금액 인출
  account1.withdraw(7000);
  print('account1 has ${account1.balance} won (7000 won is withrawn)');

  //4. 계좌 이체
  account1.transfer(account2, 5000);
  print('account2 has ${account2.balance} won (5000 won is deposited)');
  print('account1 has ${account1.balance} won');
}

class Account {
  String accountNumber;
  int balance;

  Account(this.accountNumber, this.balance);

  bool withdraw(int amount) {
    if(balance > amount) {
      balance -= amount;
      return true;
    }

    return false;
  }

  bool deposit(int amount) {
    balance += amount;
    return true;
  }

  bool transfer(Account dest, int amount) {
    if (balance > amount) {
      balance -= amount;
      dest.deposit(amount);
      return true;
    }

    return false;
  }
}

