part of 'welcome_bloc.dart';

sealed class WelcomeEvent {}

class OnTapGetStartedEvent extends WelcomeEvent {}
class OnTapLoginEvent extends WelcomeEvent {}