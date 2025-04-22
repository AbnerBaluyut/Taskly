import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '_di/dependencies.dart';
import 'features/_common_blocs/dark_mode_cubit.dart';
import 'features/_common_blocs/bottom_nav_cubit.dart';
import 'my_app.dart';
import 'core/utils/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  Bloc.observer = SimpleBlocObserver();  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DarkModeCubit()
        ),
        BlocProvider(
          create: (_) => BottomNavCubit()
        ),
      ], 
      child: const MyApp()
    )
  );
}