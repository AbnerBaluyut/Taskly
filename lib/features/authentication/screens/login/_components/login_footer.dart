import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskly/core/extensions/context_extension.dart';

import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';
import '../../../../../core/utils/enums.dart';

class LoginFooter extends StatelessWidget {

  const LoginFooter({super.key, required this.onTapSocial, required this.onTapRegister});

  final Function(Social social) onTapSocial;
  final VoidCallback onTapRegister;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          spacing: Dimension.spacingSmall,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: context.isDarkMode() ? Colors.white : Colors.black,
                overlayColor: Colors.black54
              ),
              icon: SizedBox(
                height: 40,
                width: 40,
                child: Icon(
                  FontAwesomeIcons.apple,
                  size: 30,
                  color: context.isDarkMode() ?Colors.black : Colors.white,
                ),
              ),
              onPressed: () => onTapSocial(Social.apple),
            ),
            SizedBox(width: 8), 
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.red.shade600,
                overlayColor: Colors.black54
              ),
              iconSize: 24,
               icon: SizedBox(
                height: 40,
                width: 40,
                child: Icon(
                  FontAwesomeIcons.google,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              onPressed: () => onTapSocial(Social.google),
            ),
            SizedBox(width: 8),
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
                overlayColor: Colors.black54
              ),
              iconSize: 24,
               icon: SizedBox(
                height: 40,
                width: 40,
                child: Icon(
                  FontAwesomeIcons.facebookF,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              onPressed: () => onTapSocial(Social.facebook),
            ),
          ],
        ),
        SizedBox(height: Dimension.spacingUltraLarge),
        RichText(
          text: TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(
              color: CustomColors.gray3, 
              fontWeight: FontWeight.w400,
              fontSize: 15.0
            ),
            children: [
              TextSpan(
                text: "Register",
                style: TextStyle(
                  color: CustomColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  decorationColor: CustomColors.primaryColor
                ),
                recognizer: TapGestureRecognizer()..onTap = onTapRegister,
              )
            ]
          ),
        ),
      ],
    );
  }
}