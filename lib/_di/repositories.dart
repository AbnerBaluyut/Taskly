part of 'dependencies.dart';

Future<void> _initRepositories() async {

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteSource: getIt()
    )
  );

  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remoteSource: getIt()
    )
  );
}