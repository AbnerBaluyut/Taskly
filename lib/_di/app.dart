part of 'dependencies.dart';

Future<void> _initApp() async {

  await dotenv.load(fileName: String.fromEnvironment('ENV', defaultValue: '.env.development'));

  getIt.registerSingletonWithLog<SecureStorageManager>(SecureStorageManager(FlutterSecureStorage()));
}