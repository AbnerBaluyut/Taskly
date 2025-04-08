import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';
import 'package:taskly/core/extensions/string_extension.dart';
import '../../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../../core/common_widgets/common_text_field.dart';
import '../../../../../core/router/app_routes.dart';
import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_state.dart';

class LoginContent extends StatefulWidget {

  const LoginContent({super.key, required this.onTapLogin, required this.onTapForgotPassword});

  final VoidCallback onTapForgotPassword;
  final void Function(String email, String password) onTapLogin;

  @override
  State<StatefulWidget> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<CommonTextFieldState> _nameFieldKey = GlobalKey<CommonTextFieldState>();
  final GlobalKey<CommonTextFieldState> _passwordFieldKey = GlobalKey<CommonTextFieldState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.push(AppRoutes.dashboard);
        } else if (state is AuthFailure) {
          context.showAnimatedErrorDialog(
            title: state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimension.spacingLarge
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonTextField (
                  key: _nameFieldKey,
                  enabled: (state is! AuthLoading),
                  controller: _nameController,
                  helperText: "Email",
                  hintText: "Ex. juan@gmail.com",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    var getValue = (value ?? "").trim();
                    if (getValue.isEmpty) {
                      _nameFieldKey.currentState?.shake();
                      return "Email is required";
                    } else if (!getValue.isEmailValid()) {
                      _nameFieldKey.currentState?.shake();
                      return "Email is not valid";
                    }
                    return null;
                  },
                ),
                Dimension.spacingLarge.height(),
                CommonTextField(
                  key: _passwordFieldKey,
                  enabled: (state is! AuthLoading),
                  controller: _passwordController,
                  helperText: "Password",
                  hintText: "**********",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  validator: (value) {
                    var getValue = (value ?? "").trim();
                    if (getValue.isEmpty) { 
                      _passwordFieldKey.currentState?.shake();
                      return "Password is required";
                    }
                    return null;
                  },
                ),
                Dimension.spacingSmall.height(),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      overlayColor: CustomColors.primaryColor
                    ),
                    onPressed: widget.onTapForgotPassword,
                    child: Text("Forgot Password?",
                      style: TextStyle(
                        color: CustomColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        decoration: TextDecoration.underline,
                        decorationColor: CustomColors.primaryColor
                      ),
                    ),
                  )
                ),
                Dimension.spacingSuperLarge.height(),
                SizedBox(
                  width: context.screenWidth(),
                  child: CommonElevatedButton(
                    isLoading: (state is AuthLoading),
                    onButtonPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        widget.onTapLogin.call(_nameController.text.trim(), _passwordController.text.trim());
                      }
                    },
                    text: "Login",
                    fontColor: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimension.spacingLarge,
                      vertical: Dimension.spacingMedium
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}