part of 'dependencies.dart';

Future<void> _initUseCases() async {

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCaseImpl(
      repository: getIt()
    )
  );
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCaseImpl(
      repository: getIt() 
    )
  );
  getIt.registerLazySingleton<RefreshTokenUseCase>(
    () => RefreshTokenUseCaseImpl(
      repository: getIt()
    )
  );

  getIt.registerLazySingleton<EditProfileUseCase>(
    () => EditProfileUseCaseImpl(
      repository: getIt()
    )
  );
  getIt.registerLazySingleton<ChangePasswordUseCase>(
    () => ChangePasswordUseCaseImpl(
      repository: getIt()
    )
  );
}