import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly/core/extensions/string_extension.dart';

import '../../../../../core/common_widgets/common_text_field.dart';
import '../../../../../core/styles/dimension.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_state.dart';

class RegisterContent extends StatefulWidget {

  const RegisterContent({super.key});

  @override
  State<RegisterContent> createState() => RegisterContentState();
}

class RegisterContentState extends State<RegisterContent> with AutomaticKeepAliveClientMixin {

  final GlobalKey<CommonTextFieldState> _nameFieldKey = GlobalKey<CommonTextFieldState>();
  final GlobalKey<CommonTextFieldState> _emailFieldKey = GlobalKey<CommonTextFieldState>();
  final GlobalKey<CommonTextFieldState> _passwordFieldKey = GlobalKey<CommonTextFieldState>();
  final GlobalKey<CommonTextFieldState> _confirmPasswordFieldKey = GlobalKey<CommonTextFieldState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final _focusNode = FocusNode();
  final _focusNode2 = FocusNode();
  final _focusNode3 = FocusNode();
  final _focusNode4 = FocusNode();

  String get name => _nameController.text.trim();
  String get email => _emailController.text.trim();
  String get password => _passwordController.text.trim();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        super.build(context);
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimension.spacingLarge
          ),
          child: Column(
            spacing: Dimension.spacingLarge,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonTextField(
                key: _nameFieldKey,
                enabled: (state is! RegisterLoadingState),
                focusNode: _focusNode,
                controller: _nameController,
                helperText: "Name",
                hintText: "Ex. Juan Dela Cruz",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  var getValue = (value ?? "").trim();
                  if (getValue.isEmpty) {
                    _nameFieldKey.currentState?.shake();
                    return "Name is required";
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  _focusNode2.requestFocus();
                },
              ),
              CommonTextField(
                key: _emailFieldKey,
                enabled: (state is! RegisterLoadingState),
                focusNode: _focusNode2,
                controller: _emailController,
                helperText: "Email",
                hintText: "juandelacruz@gmail.com",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  var getValue = (value ?? "").trim();
                  if (getValue.isEmpty) {
                    _emailFieldKey.currentState?.shake();
                    return "Email is required";
                  } else if (!getValue.isEmailValid()) {
                    _emailFieldKey.currentState?.shake();
                    return "Email is not valid";
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  _focusNode3.requestFocus();
                },
              ),
              CommonTextField(
                key: _passwordFieldKey,
                enabled: (state is! RegisterLoadingState),
                focusNode: _focusNode3,
                controller: _passwordController,
                helperText: "Password",
                hintText: "**********",
                obscureText: true,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  var getValue = (value ?? "").trim();
                  if (getValue.isEmpty) {
                    _passwordFieldKey.currentState?.shake();
                    return "Password is required";
                  } else if (getValue.isNotEmpty && getValue.length < 8) {
                    _passwordFieldKey.currentState?.shake();
                    return "Password must be at least 8 characters";
                  } else if (getValue.validatePassword != null) {
                    _passwordFieldKey.currentState?.shake();
                    return getValue.validatePassword;
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  _focusNode4.requestFocus();
                },
              ),
              CommonTextField(
                key: _confirmPasswordFieldKey,
                enabled: (state is! RegisterLoadingState),
                focusNode: _focusNode4,
                controller: _confirmPasswordController,
                helperText: "Confirm Password",
                hintText: "**********",
                obscureText: true,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  var getValue = (value ?? "").trim();
                  var getPasswordText = _passwordController.text.trim();
                  if (getValue.isEmpty) {
                    _confirmPasswordFieldKey.currentState?.shake();
                    return "Confirm Password is required";
                  } else if (!getValue.contains(getPasswordText)) {
                    _confirmPasswordFieldKey.currentState?.shake();
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
            ],
          ),
        );
      }
    );
  }

  @override
  bool get wantKeepAlive => true;
}