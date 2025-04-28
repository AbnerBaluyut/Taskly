part of 'dependencies.dart';

Future<void> _initNetwork() async {

  getIt.registerSingletonWithLog<DioClient>(
    DioClientImpl(
      baseUrl: Endpoints.baseUrl
    )
  );
}