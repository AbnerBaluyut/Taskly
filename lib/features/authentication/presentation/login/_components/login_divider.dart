import 'package:flutter/material.dart';

import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';

class LoginDivider extends StatelessWidget {

  const LoginDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimension.paddingLarge,
        right: Dimension.paddingLarge,
        top:  Dimension.paddingSmall,
        bottom:  Dimension.paddingSmall
      ),
      child: Row(
        spacing: Dimension.spacingMedium,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 0.5,
              color: Colors.grey.shade500,
            ),
          ),
          Text(
            'Or sign in with',
            style: TextStyle(
              fontSize: 15, 
              fontWeight: FontWeight.w400,
              color: CustomColors.gray3
            ),
          ),
          Expanded(
            child: Container(
              height: 0.5,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}