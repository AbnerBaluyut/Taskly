import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common_widgets/common_scaffold.dart';
import '../../../../../core/router/app_routes.dart';
import '../../../../../core/styles/dimension.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';
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
                      onTapLogin: (email, password) {
                        context.read<AuthBloc>().add(
                          LoginEvent(
                            email: email,
                            password: password
                          )
                        );
                      },
                      onTapForgotPassword: () {
                        context.read<AuthBloc>().add(CancelEvent());
                        log("Forgot Password");
                      },
                    ),
                    // LoginDivider(),
                    Spacer(),
                    LoginFooter(
                      onTapSocial: (social) {
                        context.read<AuthBloc>().add(CancelEvent());
                        log("Social: ${social.name}");
                      },
                      onTapRegister: () {
                        context.read<AuthBloc>().add(CancelEvent());
                        context.push(AppRoutes.register);
                      },
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