import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';

import '../../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../../core/common_widgets/common_image.dart';
import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';

class MenuSection extends StatelessWidget {

  const MenuSection({
    super.key,
    required this.icon,
    required this.title,
    required this.onButtonPressed,
    this.isLogOut = false
  });

  final String icon; 
  final String title;
  final VoidCallback onButtonPressed;
  final bool isLogOut;

  @override
  Widget build(BuildContext context) {
    return CommonElevatedButton(
      onButtonPressed: onButtonPressed,
      padding: EdgeInsets.all(Dimension.paddingMedium),
      backgroundColor: context.isDarkMode() ? CustomColors.gray2 : Colors.white,
      elevation: 0.0,
      borderRadius: BorderRadius.circular(0.0),
      shadowColor: Colors.transparent,
      overlayColor: CustomColors.primaryColor,
      custom: Row(
        children: [
          Container(
            height: 36.0,
            width: 36.0,
            decoration: BoxDecoration(
              color: CustomColors.neutral200,
              shape: BoxShape.circle
            ),
            child: CommonImage(
              path: icon,
              height: 20.0,
              width: 20.0,
            ),
          ),
          const SizedBox(width: Dimension.spacingMedium),
          Text(
            title,
            style: TextStyle(
            color: (isLogOut) 
              ? Colors.red.shade400 
              : (context.isDarkMode() ? Colors.white : CustomColors.gray2),
              fontSize: 14.0,
              fontWeight: FontWeight.w500
            ),
          ),
          Spacer(),
          Icon(
            Icons.keyboard_arrow_right_rounded,
            color: (isLogOut) 
              ? Colors.red.shade400 
              : (context.isDarkMode() ? Colors.white : CustomColors.gray2),
            size: 24.0
          )
        ],
      ),
    );
  }
}