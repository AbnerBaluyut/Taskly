import 'package:shared_preferences/shared_preferences.dart';

import '../../features/authentication/domain/entities/user_entity.dart';

class SharedPreferenceManager {

  final String _isDarkModeKey = "isDarkModeKey";
  final String _isLoggedInKey = "isLoggedInKey";
  final String _isSkipOnBoardingKey = "isSkipOnBoardingKey";
  final String _userKey = "userKey";

  final SharedPreferences _prefs;

  SharedPreferenceManager._(this._prefs);

  factory SharedPreferenceManager(SharedPreferences prefs) => SharedPreferenceManager._(prefs);

  bool get isDarkMode => _prefs.getBool(_isDarkModeKey) ?? false;
  Future<void> setIsDarkMode(bool value) async {
    await _prefs.setBool(_isDarkModeKey, value);
  }
  
  UserEntity get getUser => UserEntity.fromJsonString(_prefs.getString(_userKey) ?? "");
  Future<void> setUser(UserEntity user) async {
    await _prefs.setString(_userKey, user.toJsonString());
  }

  bool get isLoggedIn => _prefs.getBool(_isLoggedInKey) ?? false;
  Future<void> setIsLoggedIn(bool value) async {
    await _prefs.setBool(_isLoggedInKey, value);
  }

  bool get isSkipOnBoarding => _prefs.getBool(_isSkipOnBoardingKey) ?? false;
  Future<void> setIsSkipOnBoarding(bool value) async {
    await _prefs.setBool(_isSkipOnBoardingKey, value);
  }
  Future<void> clear() async {
    _prefs.remove(_isDarkModeKey);
    _prefs.remove(_isLoggedInKey);
    _prefs.remove(_userKey);
  }
}