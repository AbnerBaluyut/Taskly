import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_ext.dart';
import 'package:taskly/core/extensions/double_ext.dart';

import '../../../../core/styles/assets.dart';
import '../../../../core/styles/custom_colors.dart';
import '../../../../core/styles/dimension.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Image.asset(
            Assets.onBoarding1,
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "Welcome to \n",
            style: TextStyle(
              fontSize: 28, 
              color: context.isDarkMode() ? Colors.white54 : CustomColors.gray2,
              fontWeight: FontWeight.w400
            ),
            children: [
              TextSpan(
                text: "Taskly", 
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                  color: CustomColors.primaryColor
                )
              ),
            ]
          )
        ),
        Dimension.spacingSmall.height(),
        Text(
          "is simply dummy text of the printing and typesetting industry",
          style: TextStyle(
            fontSize: 14,
            color: context.isDarkMode() ? Colors.white60 : CustomColors.gray3,
            fontWeight: FontWeight.w400
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}