
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/app_router.dart';
import 'core/styles/theme.dart';
import 'features/_common_blocs/dark_mode_cubit.dart';

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
