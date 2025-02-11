import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/string_extension.dart';

import '../../../../../core/common_widgets/common_text_field.dart';
import '../../../../../core/styles/dimension.dart';

class RegisterContent extends StatefulWidget {

  const RegisterContent({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> {

  final GlobalKey<CommonTextFieldState> _nameFieldKey = GlobalKey<CommonTextFieldState>();
  final GlobalKey<CommonTextFieldState> _emailFieldKey = GlobalKey<CommonTextFieldState>();
  final GlobalKey<CommonTextFieldState> _passwordFieldKey = GlobalKey<CommonTextFieldState>();
  final GlobalKey<CommonTextFieldState> _confirmPasswordFieldKey = GlobalKey<CommonTextFieldState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  
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
          ),
          CommonTextField(
            key: _emailFieldKey,
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
          ),
          CommonTextField(
            key: _passwordFieldKey,
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
              }
              return null;
            },
          ),
          CommonTextField(
            key: _confirmPasswordFieldKey,
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
}