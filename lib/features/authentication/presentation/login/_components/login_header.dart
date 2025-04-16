import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_ext.dart';
import 'package:taskly/core/extensions/double_ext.dart';

import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';

class LoginHeader extends StatelessWidget{

  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        Text(
          'Login',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            color: context.isDarkMode() ? Colors.white : CustomColors.gray2
          ),
        ),
        Dimension.spacingSmall.height(),
        Text(
          "Hi! Welcome to the Taskly",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color:CustomColors.gray3
          ),
        ),
        Dimension.spacingExtraLarge.height(),
      ],
    );
  }
}