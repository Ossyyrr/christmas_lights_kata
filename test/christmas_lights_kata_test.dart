import 'package:test/test.dart';

// https://kata-log.rocks/christmas-lights-kata

void main() {
  test('turn on all lights', () {
    ChristmasLights christmasLights = ChristmasLights();
    christmasLights.turnOn(x1: 0, y1: 0, x2: 999, y2: 999);
    int ligthsOn = christmasLights.numberLightsOn();
    expect(ligthsOn, 1000000);
  });

  test('toggle lights 0,0 to 999,0 ', () {
    ChristmasLights christmasLights = ChristmasLights();
    christmasLights.toggleLights(x1: 0, y1: 0, x2: 999, y2: 0);
    int ligthsOn = christmasLights.numberLightsOn();
    expect(ligthsOn, 1000);
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
  void toggle() => isOn = !isOn;
}
