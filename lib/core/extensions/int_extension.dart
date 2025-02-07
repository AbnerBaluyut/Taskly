extension IntExtension on int {

  Duration milliseconds() {
    return Duration(milliseconds: this);
  }

  Duration seconds() {
    return Duration(seconds: this);
  }

  Duration minutes() {
    return Duration(minutes: this);
  }

  Duration hours() {
    return Duration(hours: this);
  }
}