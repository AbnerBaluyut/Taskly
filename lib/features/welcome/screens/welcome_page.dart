import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/styles/dimension.dart';
import '../../../core/common_widgets/common_scaffold.dart';
import '_components/welcome_footer.dart';
import '_components/welcome_header.dart';

class WelcomePage extends StatelessWidget {

  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {

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
              onTapGetStarted: () => context.push(AppRoutes.register),
              onTapLogin: () => context.go(AppRoutes.login),
            )
          ],
        ),
      )
    );
  }
}