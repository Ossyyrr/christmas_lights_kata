import 'package:test/test.dart';

// https://kata-log.rocks/christmas-lights-kata

void main() {
  test('turn on all lights', () {
    ChristmasLights christmasLights = ChristmasLights();
    christmasLights.turnOn(x1: 0, y1: 0, x2: 999, y2: 999);
    int ligthsOn = christmasLights.numberLightsOn();
    expect(ligthsOn, 1000000);
  });

  test('toggle lights 0,0 to 999,0', () {
    ChristmasLights christmasLights = ChristmasLights();
    christmasLights.toggleLights(x1: 0, y1: 0, x2: 999, y2: 0);
    int ligthsOn = christmasLights.numberLightsOn();
    expect(ligthsOn, 1000);
  });

  test(
      'turn off 499,499 through 500,500 would turn off (or leave off) the middle four lights',
      () {
    ChristmasLights christmasLights = ChristmasLights();
    christmasLights.toggleLights(x1: 499, y1: 499, x2: 500, y2: 500);
    int ligthsOn = christmasLights.numberLightsOn();
    expect(ligthsOn, 4);
  });

  test('Instructions should return 230022', () {
    // turn on 887,9 through 959,629
    // turn on 454,398 through 844,448
    // turn off 539,243 through 559,965
    // turn off 370,819 through 676,868
    // turn off 145,40 through 370,997
    // turn off 301,3 through 808,453
    // turn on 351,678 through 951,908
    // toggle 720,196 through 897,994
    // toggle 831,394 through 904,860

    ChristmasLights christmasLights = ChristmasLights();
    christmasLights.turnOn(x1: 887, y1: 9, x2: 959, y2: 629);
    christmasLights.turnOn(x1: 454, y1: 398, x2: 844, y2: 448);
    christmasLights.turnOff(x1: 539, y1: 243, x2: 559, y2: 965);
    christmasLights.turnOff(x1: 370, y1: 819, x2: 676, y2: 868);
    christmasLights.turnOff(x1: 145, y1: 40, x2: 370, y2: 997);
    christmasLights.turnOff(x1: 301, y1: 3, x2: 808, y2: 453);
    christmasLights.turnOn(x1: 351, y1: 678, x2: 951, y2: 908);
    christmasLights.toggleLights(x1: 720, y1: 196, x2: 897, y2: 994);
    christmasLights.toggleLights(x1: 831, y1: 394, x2: 904, y2: 860);

    int ligthsOn = christmasLights.numberLightsOn();
    expect(ligthsOn, 230022);
  });
}

class ChristmasLights {
  List<List<Light>> lights =
      List.generate(1000, (index) => List.generate(1000, (index) => Light()));

  void turnOn(
      {required int x1, required int y1, required int x2, required int y2}) {
    for (var i = x1; i <= x2; i++) {
      for (var j = y1; j <= y2; j++) {
        lights[i][j].turnOn();
      }
    }
  }

  void turnOff(
      {required int x1, required int y1, required int x2, required int y2}) {
    for (var i = x1; i <= x2; i++) {
      for (var j = y1; j <= y2; j++) {
        lights[i][j].turnOff();
      }
    }
  }

  int numberLightsOn() {
    int counter = 0;
    for (var i = 0; i < lights.length; i++) {
      for (var j = 0; j < lights[i].length; j++) {
        if (lights[i][j].isOn) {
          counter++;
        }
      }
    }

    return counter;
  }

  void toggleLights(
      {required int x1, required int y1, required int x2, required int y2}) {
    for (var i = x1; i <= x2; i++) {
      for (var j = y1; j <= y2; j++) {
        lights[i][j].toggle();
      }
    }
  }
}

class Panel {}

class Light {
  Light({
    this.isOn = false,
  });

  bool isOn;

  void turnOn() => isOn = true;
  void turnOff() => isOn = false;
  void toggle() => isOn = !isOn;
}
