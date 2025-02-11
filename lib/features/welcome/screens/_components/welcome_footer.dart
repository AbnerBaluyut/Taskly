import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../core/styles/custom_colors.dart';
import '../../../../core/styles/dimension.dart';

class WelcomeFooter extends StatelessWidget {
  
  const WelcomeFooter({super.key, required this.onTapGetStarted, required this.onTapLogin});

  final VoidCallback onTapLogin;
  final VoidCallback onTapGetStarted;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: context.screenWidth(),
          child: CommonElevatedButton(
            onButtonPressed: onTapGetStarted,
            text: "Get Started",
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            borderRadius: BorderRadius.circular(100),
            padding: EdgeInsets.symmetric(
              horizontal: Dimension.spacingLarge,
              vertical: Dimension.spacingLarge
            ),
          ),
        ),
        Dimension.spacingLarge.height(),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Already have an account? ",
            style: TextStyle(
              fontSize: 15.0, 
              color: context.isDarkMode() ? Colors.white54 : CustomColors.gray2,
              fontWeight: FontWeight.w300
            ),
            children: [
              TextSpan(
                text: "Login", 
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                  color: CustomColors.primaryColor,
                  decoration: TextDecoration.underline
                ),
                recognizer: TapGestureRecognizer()..onTap = onTapLogin
              ),   
            ]
          ),
        ),
        Dimension.spacingExtraLarge.height()
      ],
    ); 
  }
}