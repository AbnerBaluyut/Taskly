import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/double_extension.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import '../../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';
import 'overlapping_avatar.dart';

class TeamsSection extends StatelessWidget {
  const TeamsSection({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimension.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Teams",
            style: TextStyle(
              color: CustomColors.gray,
              fontSize: 18.0,
              fontWeight: FontWeight.w500
            ),
          ),
          4.height(),
          SizedBox(
            height: 60.0,
            child: Stack(
              children: [
                ...List.generate(4, (index) {
                  return OverlappingAvatar(
                    index: index,
                    right: 0.0
                  );
                }),
                Positioned(
                  left: 4 * 40.0,
                  child: Container(
                    width: 56.0,
                    height: 56.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: CustomColors.primaryColor)
                    ),
                    child: CommonElevatedButton(
                      onButtonPressed: () {},
                      borderRadius: BorderRadius.circular(28.0),
                      overlayColor: CustomColors.primaryColor,
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                      custom: Icon(
                        Icons.add,
                        size: 24.0,
                        color: CustomColors.primaryColor
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Dimension.spacingMedium.height()
        ],
      ),
    );
  }
}