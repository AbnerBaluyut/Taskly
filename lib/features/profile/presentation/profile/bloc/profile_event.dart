part of 'profile_bloc.dart';

sealed class ProfileEvent {}

class LoadDataEvent extends ProfileEvent {}
class LogOutEvent extends ProfileEvent {}