import 'dart:developer';

import 'package:get_it/get_it.dart';

extension GetItExtensions on GetIt {

  T? tryGet<T extends Object>() {
    return isRegistered<T>() ? get<T>() : null;
  }

  void registerSingletonWithLog<T extends Object>(T instance) {
    registerSingleton<T>(instance);
    log('✅ Registered Singleton: ${T.toString()}');
  }

  void registerLazySingletonWithLog<T extends Object>(T Function() factoryFunc) {
    registerLazySingleton<T>(factoryFunc);
    log('✅ Registered Lazy Singleton: ${T.toString()}');
  }

  void registerFactoryWithLog<T extends Object>(T Function() factoryFunc) {
    registerFactory<T>(factoryFunc);
    log('✅ Registered Factory: ${T.toString()}');
  }
}