part of 'profile_bloc.dart';

abstract class ProfileState {}

// Profile
class LoadDataState extends ProfileState {
  final UserEntity user;
  LoadDataState({
    required this.user
  });
}
class LogOutSuccessState extends ProfileState {}

