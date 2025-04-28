part of 'dependencies.dart';

Future<void> _initRepositories() async {

  getIt.registerLazySingletonWithLog<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteSource: getIt()
    )
  );

  getIt.registerLazySingletonWithLog<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remoteSource: getIt()
    )
  );
}