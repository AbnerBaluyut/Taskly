import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../../core/common_widgets/common_image.dart';
import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';
import '../../../../authentication/domain/entities/user_entity.dart';

class InfoSection extends StatelessWidget {

  const InfoSection({super.key, required this.user});

  final UserEntity? user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Dimension.spacingMedium.width(),
        CommonImage(
          user?.image ?? "",
          height: 80.0,
          width: 80.0,
          fit: BoxFit.cover,
          radius: 40.0
        ),
        Dimension.spacingMedium.width(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user?.name ?? "",
                style: TextStyle(
                  color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis
              ),
              Text(
                user?.email ?? "",
                style: TextStyle(
                  color: context.isDarkMode() ? Colors.white : CustomColors.gray,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis
              )
            ],
          ),
        ),
        Dimension.spacingMedium.width()
      ],
    );
  }
}