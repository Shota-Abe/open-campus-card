import 'dart:html';

class NameRepository {
  static void saveName(String value) {
    window.localStorage['name'] = value;
  }

  static String getName() {
    return window.localStorage['name'] ?? '';
  }
}
