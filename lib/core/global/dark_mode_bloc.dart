import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/shared_preferences_manager.dart';

class DarkModeBloc  extends Cubit<bool> {
  
  DarkModeBloc() : super(false) {
    _loadState();
  }

  void _loadState() async {
    final isDarkMode = SharedPrefsManager.isDarkMode;
    emit(isDarkMode);
  }

  void toggleDarkMode() {
    log("IS DARK MODE: ${!state}");
    var isDarkMode = !state;
    SharedPrefsManager.setIsDarkMode(isDarkMode);
    emit(isDarkMode);
  }
}