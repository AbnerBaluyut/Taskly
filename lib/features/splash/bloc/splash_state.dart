part of 'splash_bloc.dart';

sealed class SplashState {}

class SplashInitialState extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashLoadedState extends SplashState {}

class SplashErrorState extends SplashState {

  final String errorMessage;
  SplashErrorState(this.errorMessage);
}