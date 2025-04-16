part of 'welcome_bloc.dart';

sealed class WelcomeState {}

class WelcomeInitialState extends WelcomeState {}
class OnTapGetStartedState extends WelcomeState {}
class OnTapLoginState extends WelcomeState {}