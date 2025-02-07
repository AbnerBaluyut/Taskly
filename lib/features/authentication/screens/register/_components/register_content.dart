import 'package:flutter/material.dart';

import '../../../../../core/common_widgets/common_text_field.dart';
import '../../../../../core/styles/dimension.dart';

class RegisterContent extends StatelessWidget {

  const RegisterContent({super.key});

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
            helperText: "Name",
            hintText: "Ex. Juan Dela Cruz",
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          CommonTextField(
            helperText: "Email",
            hintText: "juandelacruz@gmail.com",
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          CommonTextField(
            helperText: "Password",
            hintText: "**********",
            obscureText: true,
            textInputAction: TextInputAction.next,
          ),
          CommonTextField(
            helperText: "Confirm Password",
            hintText: "**********",
            obscureText: true,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}