import 'package:test/test.dart';

import 'christmas_lights.dart';

void main() {
  test('turn on all lights', () {
    ChristmasLights christmasLights = ChristmasLights();
    christmasLights.turnOn(x1: 0, y1: 0, x2: 999, y2: 999);
    for (var x = 0; x <= 999; x++) {
      for (var y = 0; y <= 999; y++) {
        expect(christmasLights.lights[x][y].isOn, true);
      }
    }
  });

  test('toggle lights 0,0 to 999,0', () {
    ChristmasLights christmasLights = ChristmasLights();
    christmasLights.toggleLights(x1: 0, y1: 0, x2: 999, y2: 0);
    for (var x = 0; x <= 999; x++) {
      for (var y = 0; y <= 999; y++) {
        if (y == 0) {
          expect(christmasLights.lights[x][y].isOn, true);
          return;
        }
        expect(christmasLights.lights[x][y].isOn, false);
      }
    }
  });

  test(
      'turn off 499,499 through 500,500 would turn off (or leave off) the middle four lights',
      () {
    ChristmasLights christmasLights = ChristmasLights();
    christmasLights.toggleLights(x1: 499, y1: 499, x2: 500, y2: 500);
    for (var x = 0; x <= 999; x++) {
      for (var y = 0; y <= 999; y++) {
        if (x == 499 && y == 499) {
          expect(christmasLights.lights[x][y].isOn, true);
          return;
        }
        if (x == 499 && y == 500) {
          expect(christmasLights.lights[x][y].isOn, true);
          return;
        }
        if (x == 500 && y == 499) {
          expect(christmasLights.lights[x][y].isOn, true);
          return;
        }
        if (x == 500 && y == 500) {
          expect(christmasLights.lights[x][y].isOn, true);
          return;
        }
        expect(christmasLights.lights[x][y].isOn, false);
      }
    }
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

    int counter = 0;
    for (var i = 0; i < 1000; i++) {
      for (var j = 0; j < 1000; j++) {
        if (christmasLights.lights[i][j].isOn) {
          counter++;
        }
      }
    }

    expect(counter, 230022);
  });
}
