import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../../core/common_widgets/common_image.dart';
import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';

class MenuSection extends StatelessWidget {

  const MenuSection({
    super.key,
    required this.icon,
    this.iconColor = CustomColors.primaryColor,
    this.overlayColor = CustomColors.primaryColor,
    required this.title,
    required this.tintColor,
    required this.onButtonPressed,
  });

  final String icon;
  final Color iconColor;

  final String title;
  final Color tintColor;
  final Color overlayColor;

  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return CommonElevatedButton(
      onButtonPressed: onButtonPressed,
      padding: EdgeInsets.all(Dimension.paddingMedium),
      backgroundColor: context.isDarkMode() ? CustomColors.gray2 : Colors.white,
      elevation: 0.0,
      borderRadius: BorderRadius.circular(0.0),
      shadowColor: Colors.transparent,
      overlayColor: overlayColor,
      custom: Row(
        children: [
          CircleAvatar(
            backgroundColor: CustomColors.neutral200,
            child: CommonImage(
              path: icon,
              height: 20.0,
              width: 20.0,
              color: iconColor,
            ),
          ),
          Dimension.spacingMedium.width(),
          Text(
            title,
            style: TextStyle(
            color: tintColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w500
            ),
          ),
          Spacer(),
          Icon(
            Icons.keyboard_arrow_right_rounded,
            color: tintColor,
            size: 24.0
          )
        ],
      ),
    );
  }
}