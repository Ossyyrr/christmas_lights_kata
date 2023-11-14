class Light {
  Light({
    this.isOn = false,
  });

  bool isOn;

  void turnOn() => isOn = true;
  void turnOff() => isOn = false;
  void toggle() => isOn = !isOn;
}
