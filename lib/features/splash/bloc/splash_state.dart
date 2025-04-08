abstract class SplashState {}

class SplashInitialState extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashLoadedState extends SplashState {
  final bool isUserLoggedIn;
  final bool isOnBoardingCompleted;

  SplashLoadedState({this.isUserLoggedIn = false, this.isOnBoardingCompleted = false});
}

class IsUserLoggedInState extends SplashState {}