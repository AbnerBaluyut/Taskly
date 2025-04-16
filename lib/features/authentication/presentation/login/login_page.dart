import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common_widgets/common_scaffold.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/styles/dimension.dart';
import 'bloc/login_bloc.dart';
import '_components/login_content.dart';
import '_components/login_footer.dart';
import '_components/login_header.dart';

class LoginPageWrapper extends StatelessWidget {

  const LoginPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
} 
class _LoginPageState extends State<LoginPage> {

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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LoginHeader(),
                    LoginContent(
                      onTapLogin: (email, password) {
                        context.read<LoginBloc>().add(
                          DoLoginEvent(
                            email: email,
                            password: password
                          )
                        );
                      },
                      onTapForgotPassword: () {
                        context.read<LoginBloc>().add(CancelEvent());
                        log("Forgot Password");
                      },
                    ),
                    LoginFooter(
                      onTapSocial: (social) {
                        context.read<LoginBloc>().add(CancelEvent());
                        log("Social: ${social.name}");
                      },
                      onTapRegister: () {
                        context.read<LoginBloc>().add(CancelEvent());
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