import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import '../../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../../core/common_widgets/common_text_field.dart';
import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';

class LoginContent extends StatefulWidget {

  const LoginContent({super.key, required this.onTapForgotPassword, required this.onTapLogin});

  final VoidCallback onTapForgotPassword;
  final VoidCallback onTapLogin;


  @override
  State<StatefulWidget> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  //testing
  String? errorNameText;
  String? errorPasswordText;

  @override
  void initState() {
    _nameController.addListener(_nameListener);
    _passwordController.addListener(_passwordListener);
    super.initState();
  }

  void _nameListener() {
    if (_nameController.text.isNotEmpty) {
      setState(() {
        errorNameText = null;
      });
    } 
  }

  void _passwordListener() {
    if (_passwordController.text.isNotEmpty) {
      setState(() {
        errorPasswordText = null;
      });
    } 
  }
  
  @override
  Widget build(BuildContext context) {
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
              controller: _nameController,
              helperText: "Name",
              hintText: "Ex. Juan Dela Cruz",
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              errorText: errorNameText,
              validator: (value) {
                var getValue = (value ?? "").trim();
                if (getValue.isEmpty) {
                  setState(() {
                    errorNameText = "Name is required";
                  });
                  return null;
                } else {
                  setState(() {
                    errorNameText = null;
                  });
                  return null;
                }
              },
            ),
            const SizedBox(height: Dimension.spacingLarge),
            CommonTextField(
              controller: _passwordController,
              helperText: "Password",
              hintText: "**********",
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: true,
              errorText: errorPasswordText,
              validator: (value) {
                var getValue = (value ?? "").trim();
                if (getValue.isEmpty) {
                  setState(() {
                    errorPasswordText = "Password is required";
                  });
                  return null;
                } else {
                  setState(() {
                    errorPasswordText = null;
                  });
                  return null;
                }
              },
            ),
            const SizedBox(height: Dimension.spacingSmall),
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
            const SizedBox(height: Dimension.spacingSuperLarge),
            SizedBox(
              width: context.screenWidth(),
              child: CommonElevatedButton(
                onButtonPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onTapLogin();
                  }
                },
                text: "Login",
                fontColor: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimension.spacingLarge,
                  vertical: Dimension.spacingLarge
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}