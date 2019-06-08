void main() {
  //1. 리스트 선언
  List<int> numbers = [100, 200, 300];
  List<int> evens = [2, 4, 6, 8, 10];

  List<String> planets = ['Earth', 'Jupiter', 'Mars', 'Saturn'];
  List<String> otherPlanets = ['Venus', 'Mercury', 'Neptune'];

  //2. 리스트 기본 사용
  print('numbers are $numbers');
  print('first number is ${numbers[0]}');
  print('last number is ${numbers[numbers.length -1]}');
  //print('last number is ${numbers[-1]}'); //not working!!

  for (int each in evens) {
    print('each even number is $each');
  }

  evens.forEach((each) => print('each even number is $each'));

  //3. 메서드 호출


  //4. 리스트 그외 활용
  //List<int> evenFromZero = [0, ...evens]; //dart 2.3

  List<String> allPlanets = planets + otherPlanets;
  print('All planets are $allPlanets');
}
