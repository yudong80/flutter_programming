void main() {
  //1. Game 클래스 생성
  Game game1 = Game('Star Craft', 'Strategy');
  Game game2 = ArcadeGame('Strike 1945', 'Shooting', true);

  //2. 속성 (getter, setter)
  print('game1 is ${game1.name}');
  print('game2 is ${game2.name}');

  game1.genre = 'Realtime Strategy';

  //3. 메서드 호출
  game1.play();
  game2.play();
}

class Game { //부모 클래스
  String _name;
  String _genre;

  Game(this._name, this._genre); //생성자

  //getter, setter
  String get name => _name;
  set genre(g) => this._genre = g;

  void play() {
    print('play $_name game($_genre)!!');
  }
}

class ArcadeGame extends Game { //자식 클래스
  bool _joystickSupport = false;

  //생성자
  ArcadeGame(String name, String genre, this._joystickSupport) : super(name, genre);

  @override  //메서드 오버라이드
  void play() {
    print('$name supports joystick? $_joystickSupport');
  }
}