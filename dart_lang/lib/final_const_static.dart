void main() {
  //1. final
  final String name = 'Tony';
  //name = 'Steve'; //compile error!!

  //2. const
  const int STUDENTS_MAX = 100;
  const double PIE = 3.14159326;

  //3. static
  print('Queue initial capacity is ${Queue.initialCapacity}');
}

class Queue {
  static const initialCapacity = 12;
}