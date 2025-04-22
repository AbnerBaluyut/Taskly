part of 'dependencies.dart';

Future _initRemoteSources() async {

  getIt.registerLazySingleton<AuthRemoteSource>(
    () => AuthRemoteSourceImpl(
      client: getIt(),
    )
  );

  getIt.registerLazySingleton<ProfileRemoteSource>(
      () => ProfileRemoteSourceImpl(
      client: getIt(),
      sharedPreferenceManager: getIt()
    )
  );
}