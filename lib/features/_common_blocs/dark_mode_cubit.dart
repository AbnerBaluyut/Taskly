import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../_di/dependencies.dart';
import '../../core/utils/secure_storage_manager.dart';

class DarkModeCubit extends Cubit<bool> {

   final SecureStorageManager _sharedPrefsManager;
  
  DarkModeCubit() :
    _sharedPrefsManager = getIt(), 
    super(false) {
      _loadState();
    }

  void _loadState() async {
    final isDarkMode = await _sharedPrefsManager.isDarkMode;
    emit(isDarkMode);
  }

  void toggleDarkMode() {
    log("IS DARK MODE: ${!state}");
    var isDarkMode = !state;
    _sharedPrefsManager.setIsDarkMode(isDarkMode);
    emit(isDarkMode);
  }
}