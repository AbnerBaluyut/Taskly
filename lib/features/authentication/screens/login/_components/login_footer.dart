import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskly/core/extensions/context_extension.dart';

import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';
import '../../../../../core/utils/enums/social.dart';
import '../../../models/social_model.dart';
import 'item_social_button.dart';

class LoginFooter extends StatelessWidget {

  const LoginFooter({super.key, required this.onTapSocial, required this.onTapRegister});

  final Function(Social social) onTapSocial;
  final VoidCallback onTapRegister;

  @override
  Widget build(BuildContext context) {

    List<SocialModel> socials = [
      SocialModel(
        icon: FontAwesomeIcons.apple,
        social: Social.apple,
        backgroundColor: context.isDarkMode() ? Colors.white : Colors.black,
        iconColor: context.isDarkMode() ?Colors.black : Colors.white
      ),
      SocialModel(
        icon: FontAwesomeIcons.google,
        social: Social.google,
        backgroundColor: Colors.red.shade600,
        iconColor: Colors.white
      ),
      SocialModel(
        icon: FontAwesomeIcons.facebookF,
        social: Social.facebook,
        backgroundColor: Colors.blue.shade800,
        iconColor: Colors.white
      )
    ];

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
          children: socials.map((item) => ItemSocialButton(
              item: item,
              onTapSocial: () => log(item.social.name),
            )
          ).toList(),
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