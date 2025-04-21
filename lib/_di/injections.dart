
import 'exports.dart';

final getIt = GetIt.I;

Future<void> initDependencies() async {

  await dotenv.load(fileName: String.fromEnvironment('ENV', defaultValue: '.env.development'));

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferenceManager>(() => SharedPreferenceManager(sharedPreferences));

  getIt.registerLazySingleton<DioClient>(() => DioClientImpl(
    baseUrl: Endpoints.baseUrl
  ));


  //* ========= AUTHENTICATION

    // Remote Source //
    getIt.registerLazySingleton<AuthRemoteSource>(
      () => AuthRemoteSourceImpl(
        client: getIt(),
      )
    );

    // Repositories //
    getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteSource: getIt()
      )
    );

    // Usecases //
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

  //* ========= AUTHENTICATION



  //* ========= PROFILE

     // Remote Source //
    getIt.registerLazySingleton<ProfileRemoteSource>(
      () => ProfileRemoteSourceImpl(
        client: getIt(),
        sharedPreferenceManager: getIt()
      )
    );

     // Repositories //
    getIt.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(
        remoteSource: getIt()
      )
    );

    // Usecases //
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

  //* ========= PROFILE
}