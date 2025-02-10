import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {

  static const String _isDarkModeKey = "isDarkModeKey";

  static final SharedPrefsManager _instance = SharedPrefsManager._internal();
  static SharedPreferences? _prefs;

  factory SharedPrefsManager() {
    return _instance;
  }

  SharedPrefsManager._internal();

  /// Initialize SharedPreferences (Call this in `main` before running the app)
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Toggle the dark mode state
  static bool get isDarkMode => _prefs?.getBool(_isDarkModeKey) ?? false;
  static setIsDarkMode(bool value) => _prefs?.setBool(_isDarkModeKey, value);
}