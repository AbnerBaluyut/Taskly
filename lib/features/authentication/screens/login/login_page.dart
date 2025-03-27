import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common_widgets/common_scaffold.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/styles/dimension.dart';
import '_components/login_content.dart';
// import '_components/login_divider.dart';
import '_components/login_footer.dart';
import '_components/login_header.dart';

class LoginPage extends StatelessWidget {
  
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CommonScaffold(
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth
              ),
              child: IntrinsicHeight(
                child: Column(
                  spacing: Dimension.spacingLarge,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    LoginHeader(),
                    LoginContent(
                      onTapForgotPassword: () {
                        log("Forgot Password");
                      },
                      onTapLogin: () => context.go(AppRoutes.dashboard),
                    ),
                    // LoginDivider(),
                    Spacer(),
                    LoginFooter(
                      onTapSocial: (social) {
                        log("Social: ${social.name}");
                      },
                      onTapRegister: () => context.push(AppRoutes.register),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}