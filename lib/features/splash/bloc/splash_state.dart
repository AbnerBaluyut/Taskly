part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();
  @override
  List<Object?> get props => [];
}

class SplashInitialState extends SplashState {}

class SplashLoadingState extends SplashState {}

class GoToOnBoardingState extends SplashState {}
class GoToLoginState extends SplashState {}
class GoToDashboardState extends SplashState {}