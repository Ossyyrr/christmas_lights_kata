import 'light.dart';

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

  void toggleLights(
      {required int x1, required int y1, required int x2, required int y2}) {
    for (var i = x1; i <= x2; i++) {
      for (var j = y1; j <= y2; j++) {
        lights[i][j].toggle();
      }
    }
  }
}
