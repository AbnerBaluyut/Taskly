import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';

class RegisterHeader extends StatelessWidget {

  const RegisterHeader({super.key, required this.onTapCamera});

  final VoidCallback onTapCamera;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "Create Account",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        Dimension.spacingSmall.height(),
        Text(
          "Fill your information below",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: CustomColors.gray3
          ),
        ),
        Dimension.spacingExtraLarge.height(),
        Stack(
          alignment: Alignment.bottomRight,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(80)
              ),
              child: Icon(Icons.person, size: 50.0, color: Colors.grey.shade700)
            ),
            SizedBox(
              height: 30,
              width: 30,
              child: CommonElevatedButton.circleIcon(
                onPressed: onTapCamera,
                padding: EdgeInsets.zero,
                icon: Icon(Icons.camera_alt, color: Colors.white, size: 20,),
              ),
            )
          ],
        ),
      ],
    );
  }
}