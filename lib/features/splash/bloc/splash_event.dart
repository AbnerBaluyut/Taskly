part of 'splash_bloc.dart';

sealed class SplashEvent {}

class LoadSplashEvent extends SplashEvent {}
class ClearPrefsEvent extends SplashEvent {}

// EVENT >>>>> BLOC >>>> STATE >>>> UI