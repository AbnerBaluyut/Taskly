import 'exports.dart';

part 'app.dart';
part 'network.dart';
part 'remote_sources.dart';
part 'repositories.dart';
part 'usecases.dart';

final getIt = GetIt.I;

Future<void> initDependencies() async {

  // App
  await _initApp();

  // Network
  await _initNetwork();
  
  // Remote Sources
  await _initRemoteSources();

  // Repositories
  await _initRepositories();

  // UseCases
  await _initUseCases();
}