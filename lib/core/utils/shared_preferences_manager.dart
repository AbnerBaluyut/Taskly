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

  /// Save a String value
  static Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  /// Retrieve a String value
  static String? getString(String key) {
    return _prefs?.getString(key);
  }

  /// Save an int value
  static Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  /// Retrieve an int value
  static int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  /// Save a boolean value
  static Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  /// Retrieve a boolean value
  static bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  /// Save a double value
  static Future<void> setDouble(String key, double value) async {
    await _prefs?.setDouble(key, value);
  }

  /// Retrieve a double value
  static double? getDouble(String key) {
    return _prefs?.getDouble(key);
  }

  /// Save a list of strings
  static Future<void> setStringList(String key, List<String> value) async {
    await _prefs?.setStringList(key, value);
  }

  /// Retrieve a list of strings
  static List<String>? getStringList(String key) {
    return _prefs?.getStringList(key);
  }

  /// Remove a specific key
  static Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  /// Clear all stored values
  static Future<void> clear() async {
    await _prefs?.clear();
  }

  /// Toggle the dark mode state
  static bool get isDarkMode => _prefs?.getBool(_isDarkModeKey) ?? false;
  static setIsDarkMode(bool value) => _prefs?.setBool(_isDarkModeKey, value);
}