import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/utils/shared_preferences_manager.dart';

class DarkModeCubit extends Cubit<bool> {

   final SharedPreferenceManager _sharedPrefsManager;
  
  DarkModeCubit() :
    _sharedPrefsManager = GetIt.I<SharedPreferenceManager>(), 
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