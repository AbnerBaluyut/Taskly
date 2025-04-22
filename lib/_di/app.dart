part of 'dependencies.dart';

Future<void> _initApp() async {

  await dotenv.load(fileName: String.fromEnvironment('ENV', defaultValue: '.env.development'));

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferenceManager>(() => SharedPreferenceManager(sharedPreferences));
}