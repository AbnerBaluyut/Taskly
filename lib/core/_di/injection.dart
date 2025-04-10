import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/remote_sources/auth_remote_source.dart';
import '../../data/remote_sources/profile_remote_source.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/profile_repository.dart';
import '../../data/usecases/edit_profile_usecase.dart';
import '../../data/usecases/login_usecase.dart';
import '../../features/authentication/data/remote_sources/auth_remote_source_impl.dart';
import '../../features/authentication/data/repositories/auth_repository_impl.dart';
import '../../features/authentication/domain/usecases/login_usecase_impl.dart';
import '../../features/profile/data/remote_sources/profile_remote_source_impl.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/profile/domain/usecases/edit_profile_usecase_impl.dart';
import '../constants/endpoints.dart';
import '../services/dio_client.dart';
import '../utils/shared_preferences_manager.dart';

final _inject = GetIt.I;

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



  //* ========= PROFILE

     // Remote Source //
    _inject.registerLazySingleton<ProfileRemoteSource>(
      () => ProfileRemoteSourceImpl(
        client: _inject(),
        sharedPreferenceManager: _inject()
      )
    );

     // Repositories //
    _inject.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(
        remoteSource: _inject()
      )
    );

    // Usecases //
    _inject.registerLazySingleton<EditProfileUseCase>(() => EditProfileUseCaseImpl(
      repository: _inject()
    ));

  //* ========= PROFILE
}