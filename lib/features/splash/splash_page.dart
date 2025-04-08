import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/app_routes.dart';
import '../../core/common_widgets/common_scaffold.dart';
import '_components/logo.dart';
import 'bloc/splash_bloc.dart';
import 'bloc/splash_event.dart';
import 'bloc/splash_state.dart';

class SplashPage extends StatelessWidget {

  const SplashPage({super.key}); 

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..add(LoadSplashEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashLoadedState) {
      
            if (state.isOnBoardingCompleted) {
              if (state.isUserLoggedIn) {
                context.go(AppRoutes.dashboard);
              } else {
                context.go(AppRoutes.login);
              }
            } else {
               context.go(AppRoutes.onBoarding);
            }
          }
        },
        child: CommonScaffold(
          body: Logo()
        )
      ),
    );
  }
}