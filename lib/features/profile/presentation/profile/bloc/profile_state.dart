part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {}

// Profile
class LoadDataState extends ProfileState {
  final UserEntity user;
  const LoadDataState({
    required this.user
  });

  @override
  List<Object?> get props => [user];
}
class LogOutSuccessState extends ProfileState {}

