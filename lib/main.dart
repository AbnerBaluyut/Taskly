import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/_di/injection.dart';
import 'core/router/app_router.dart';
import 'core/global/dark_mode_bloc.dart';
import 'core/styles/theme.dart';
import 'features/authentication/presentation/bloc/auth_bloc.dart';
import 'features/dashboard/bloc/bottom_nav_bloc.dart';
import 'features/dashboard/bloc/dashboard_bloc.dart';
import 'features/profile/bloc/profile_bloc.dart';
import 'features/splash/bloc/splash_bloc.dart';
import 'features/welcome/bloc/welcome_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DarkModeCubit()
        ),
        BlocProvider(
          create: (_) => SplashBloc()
        ),
        BlocProvider(
          create: (_) => WelcomeBloc()
        ),
        BlocProvider(
          create: (_) => ProfileBloc()
        ),
        BlocProvider(
          create: (_) => BottomNavCubit()
        ),
        BlocProvider(
          create: (_) => DashboardBloc()
        ),
        BlocProvider(
          create: (_) => AuthBloc()
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
    return BlocBuilder<DarkModeCubit, bool>(
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
