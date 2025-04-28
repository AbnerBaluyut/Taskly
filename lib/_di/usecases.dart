part of 'dependencies.dart';

Future<void> _initUseCases() async {

  getIt.registerLazySingletonWithLog<LoginUseCase>(
    () => LoginUseCaseImpl(
      repository: getIt()
    )
  );
  getIt.registerLazySingletonWithLog<RegisterUseCase>(
    () => RegisterUseCaseImpl(
      repository: getIt() 
    )
  );
  getIt.registerLazySingletonWithLog<RefreshTokenUseCase>(
    () => RefreshTokenUseCaseImpl(
      repository: getIt()
    )
  );

  getIt.registerLazySingletonWithLog<EditProfileUseCase>(
    () => EditProfileUseCaseImpl(
      repository: getIt()
    )
  );
  getIt.registerLazySingletonWithLog<ChangePasswordUseCase>(
    () => ChangePasswordUseCaseImpl(
      repository: getIt()
    )
  );
}