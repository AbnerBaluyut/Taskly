
import 'exports.dart';

part 'app.dart';
part 'remote_sources.dart';
part 'repositories.dart';
part 'usecases.dart';

final getIt = GetIt.I;

Future<void> initDependencies() async {

  // App
  await _initApp();

  // Remote Sources
  await _initRemoteSources();

  // Repositories
  await _initRepositories();

  // UseCases
  await _initUseCases();

  // Network
  getIt.registerLazySingleton<DioClient>(() => DioClientImpl(
    baseUrl: Endpoints.baseUrl
  ));
}