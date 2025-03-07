import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../../core/common_widgets/common_image.dart';
import '../../../../../core/styles/assets.dart';
import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Dimension.spacingSuperLarge.height(),
        Padding(padding: const EdgeInsets.symmetric(horizontal: Dimension.paddingMedium),  
          child: Text(
            "Profile",
            style: TextStyle(
              color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
              fontSize: 25.0,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimension.paddingMedium,
            vertical: Dimension.paddingSmall
          ),
          child: Row(
            children: [
              CommonImage(
                path: Assets.face,
                height: 80.0,
                width: 80.0,
                fit: BoxFit.contain,
                radius: 40.0
              ),
              const SizedBox(width: Dimension.spacingMedium),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Doe",
                      style: TextStyle(
                        color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis
                    ),
                    Text(
                      "johndoe@gmail.com",
                      style: TextStyle(
                        color: context.isDarkMode() ? Colors.white : CustomColors.gray,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}