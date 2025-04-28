import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/authentication/domain/entities/user_entity.dart';

class SecureStorageManager {

  final String _isDarkModeKey = "isDarkModeKey";
  final String _isLoggedInKey = "isLoggedInKey";
  final String _isSkipOnBoardingKey = "isSkipOnBoardingKey";
  final String _userKey = "userKey";

  final FlutterSecureStorage _prefs;

  SecureStorageManager._(this._prefs);

  factory SecureStorageManager(FlutterSecureStorage prefs) => SecureStorageManager._(prefs);

  Future<bool> get isDarkMode async => await _prefs.read(key: _isDarkModeKey) == 'true';
  Future<void> setIsDarkMode(bool value) async {
    await _prefs.write(key: _isDarkModeKey, value: value.toString());
  }
  
  Future<UserEntity> get getUser async {
    var jsonString = await _prefs.read(key: _userKey) ?? "";
    return UserEntity.fromJsonString(jsonString);
  }
  Future<void> setUser(UserEntity user) async {
    await _prefs.write(key: _userKey, value: user.toJsonString());
  }

  Future<bool> get isLoggedIn async => await _prefs.read(key: _isLoggedInKey) == 'true';
  Future<void> setIsLoggedIn(bool value) async {
    await _prefs.write(key: _isLoggedInKey, value: value.toString());
  }

  Future<bool> get isSkipOnBoarding async => await _prefs.read(key: _isSkipOnBoardingKey) == 'true';
  Future<void> setIsSkipOnBoarding(bool value) async {
    await _prefs.write(key: _isSkipOnBoardingKey, value: value.toString());
  }
  Future<void> clearAll() async {
    await _prefs.delete(key: _isDarkModeKey);
    await _prefs.delete(key: _isLoggedInKey);
    await _prefs.delete(key: _userKey);
  }
}