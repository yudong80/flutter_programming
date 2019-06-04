void main() {
  //1. if
  int even = 78;
  int odd = 99;
  if (even % 2 == 0) {
    print('$even is even number');
  }

  if (odd % 2 == 0) {
    print('$odd is not even number');
  } else {
    print('$odd is odd number');
  }

  //2. for
  List<String> fruits = ['Apple', 'Banana', "Kiwi"];
  for (String fruit in fruits) {
    print('I like $fruit');
  }

  //3. while
  List<num> numbers = [100, 200, -1];
  int i=0;
  while(numbers[i] > 0) {
    print('${numbers[i]} is positive');
    i = i + 1;
  }

  //4. do-while
  int j = 5;
  do {
    print(j);
    j--;
  } while(j > 0);

  //5. switch / case
  List<num> httpCodes = [200, 401, 500];
  for (num http in httpCodes) {
    switch(http) {
      case 200:
        print('200 is OK');
        break;
      case 401:
        print('400 is Unautherized');
        break;
      case 500:
        print('500 is Internal Server Error');
        break;
    }
  }
}