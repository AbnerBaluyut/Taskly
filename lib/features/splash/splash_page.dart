import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:taskly/core/extensions/context_ext.dart';
import 'package:taskly/core/extensions/double_ext.dart';

import '../../core/router/app_routes.dart';
import '../../core/common_widgets/common_scaffold.dart';
import '../../core/styles/custom_colors.dart';
import '../../core/styles/dimension.dart';
import '_components/logo.dart';
import 'bloc/splash_bloc.dart';

class SplashPageWrapper extends StatelessWidget {
  const SplashPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => SplashBloc()..add(LoadSplashEvent()),
      child: SplashPage(),
    );
  }
}

class SplashPage extends StatelessWidget {

  const SplashPage({super.key}); 

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is GoToOnBoardingState) {
          context.go(AppRoutes.onBoarding);
        } else if (state is GoToLoginState) {
          context.go(AppRoutes.login);
        } else if (state is GoToDashboardState) {
          context.go(AppRoutes.dashboard);
        }
      },
      builder: (context, state) {
        return CommonScaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Logo(),
              LoadingAnimationWidget.threeRotatingDots(
                color: CustomColors.primaryColor,
                size: 30.0,
              ),
              Dimension.spacingLarge.height()
            ],
          )
        );
      },
    );
  }
}