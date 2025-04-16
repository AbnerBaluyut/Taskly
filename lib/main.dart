import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '_di/injections.dart';
import 'core/router/app_router.dart';
import 'features/_common_blocs/dark_mode_cubit.dart';
import 'core/styles/theme.dart';
import 'features/_common_blocs/bottom_nav_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, bool>(
      builder: (context, isDarkMode) {
        return MaterialApp.router(
          title: 'Taskly',
          theme: isDarkMode ? darkTheme : lightTheme,
          // themeMode: ThemeMode.system,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
