import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../_di/dependencies.dart';
import '../../core/utils/shared_preferences_manager.dart';

class DarkModeCubit extends Cubit<bool> {

   final SharedPreferenceManager _sharedPrefsManager;
  
  DarkModeCubit() :
    _sharedPrefsManager = getIt(), 
    super(false) {
      _loadState();
    }

  void _loadState() async {
    final isDarkMode = _sharedPrefsManager.isDarkMode;
    emit(isDarkMode);
  }

  void toggleDarkMode() {
    log("IS DARK MODE: ${!state}");
    var isDarkMode = !state;
    _sharedPrefsManager.setIsDarkMode(isDarkMode);
    emit(isDarkMode);
  }
}