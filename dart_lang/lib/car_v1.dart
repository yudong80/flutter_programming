void main() {
  //1. Car 생성
  Car car = new Car();

  //2. 주유 (최대로)
  car.putGas(Car.FUEL_MAX);
  print('Car has ${car.fuel} litter');

  //3. 주행 (60 km)
  car.drive(60);
  print('Car drove ${car.totalDistance} km');
  print('Car has ${car.fuel} litter');
}

class Car {
  static const int FUEL_MAX = 100;

  int fuel = 0;
  int totalDistance = 0;

  int putGas(int gas) {
    fuel += gas;
    if (fuel > FUEL_MAX) {
      fuel = FUEL_MAX;
    }

    return fuel;
  }

  int drive(int distance) {
    if (fuel >= distance) {
      fuel -= distance;
      totalDistance += distance;
      return fuel;
    }

    totalDistance += fuel;
    fuel = 0;
    return fuel;
  }
}