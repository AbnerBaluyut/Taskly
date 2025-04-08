import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/_datasources/auth_remote_source.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/usecases/login_usecase.dart';
import '../../features/authentication/data/_datasources/auth_remote_source_impl.dart';
import '../../features/authentication/data/repositories/auth_repository_impl.dart';
import '../../features/authentication/domain/usecases/login_usecase_impl.dart';
import '../constants/endpoints.dart';
import '../services/dio_client.dart';
import '../utils/shared_preferences_manager.dart';

final _inject = GetIt.instance;

Future<void> initDependency() async {

  final sharedPreferences = await SharedPreferences.getInstance();
  _inject.registerLazySingleton<SharedPreferenceManager>(() => SharedPreferenceManager(sharedPreferences));

  _inject.registerLazySingleton(() => DioClient(
    baseUrl: Endpoints.baseUrl
  ));


  //* ========= AUTHENTICATION

    // Remote Source //
    _inject.registerLazySingleton<AuthRemoteSource>(() {
      return AuthRemoteSourceImpl(
        client: _inject(),
      );
    });

    // Repositories //
    _inject.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      remoteSource: _inject()
    ));

    // Usecases //
    _inject.registerLazySingleton<LoginUseCase>(() => LoginUseCaseImpl(
      repository: _inject()
    ));

  //* ========= AUTHENTICATION




}