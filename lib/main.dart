import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/router/app_router.dart';
import 'core/global/dark_mode_bloc.dart';
import 'core/utils/shared_preferences_manager.dart';
import 'core/styles/theme.dart';
import 'features/dashboard/bloc/bottom_nav_bloc.dart';
import 'features/dashboard/bloc/dashboard_bloc.dart';
import 'features/splash/bloc/splash_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsManager.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DarkModeBloc()
        ),
        BlocProvider(
          create: (_) => SplashBloc()
        ),
        BlocProvider(
          create: (_) => BottomNavBloc()
        ),
        BlocProvider(
          create: (_) => DashboardBloc()
        )
      ], 
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeBloc, bool>(
      builder: (context, isDarkMode) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          theme: isDarkMode ? darkTheme : lightTheme,
          // themeMode: ThemeMode.system,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
