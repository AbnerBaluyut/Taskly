part of 'dependencies.dart';

Future<void> _initRemoteSources() async {

  getIt.registerLazySingletonWithLog<AuthRemoteSource>(
    () => AuthRemoteSourceImpl(
      client: getIt(),
    )
  );

  getIt.registerLazySingletonWithLog<ProfileRemoteSource>(
      () => ProfileRemoteSourceImpl(
      client: getIt(),
      sharedPreferenceManager: getIt()
    )
  );
}