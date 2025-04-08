import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/styles/dimension.dart';
import '../../../core/common_widgets/common_scaffold.dart';
import '../bloc/welcome_bloc.dart';
import '../bloc/welcome_event.dart';
import '../bloc/welcome_state.dart';
import '_components/welcome_footer.dart';
import '_components/welcome_header.dart';

class WelcomePage extends StatelessWidget {

  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => WelcomeBloc(),
      child: BlocConsumer<WelcomeBloc, WelcomeState>(
        listener: (context, state) {
          if (state is OnTapGetStartedState) {
            context.push(AppRoutes.register);
          } else if (state is OnTapLoginState) {
            context.push(AppRoutes.login);
          }
        },
        builder: (context, state) {
          return CommonScaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimension.spacingLarge
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: WelcomeHeader()
                  ),
                  WelcomeFooter(
                    onTapGetStarted: () => context.read<WelcomeBloc>().add(OnTapGetStarted()),
                    onTapLogin: () => context.read<WelcomeBloc>().add(OnTapLogin()),
                  )
                ],
              ),
            )
          );
        },
      ),
    );
  }
}