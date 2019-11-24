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
    if(amount > 0) { //양수의 금액만 입금할 수 있다
      balance += amount;
      return true;
    }
    return false;
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

