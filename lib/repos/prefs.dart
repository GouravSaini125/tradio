import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences prefs;
  static loadPrefs() async {
      prefs = await SharedPreferences.getInstance();
  }
}
