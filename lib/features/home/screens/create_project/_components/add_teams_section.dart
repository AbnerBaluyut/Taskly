import 'package:flutter/material.dart';
import 'package:taskly/core/common_widgets/common_elevated_button.dart';
import 'package:taskly/core/extensions/context_extension.dart';

import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';

class AddTeamsSection extends StatelessWidget {

  const AddTeamsSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: Dimension.spacingSmall,
      children: [
        Text(
          "Teams",
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w500,
            color: context.isDarkMode() ? Colors.white54 : CustomColors.gray
          ),
        ),
        CommonElevatedButton.circleIcon(
          padding: EdgeInsets.zero,
          icon: Icon(Icons.add, color: Colors.grey),
          shape: CircleBorder(
            side: BorderSide(
              color: Colors.grey
            ),
          ),
          backgroundColor: Colors.white,
          targetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size(34, 34),
          onPressed: () {

          }
        )
      ],
    );
  }
}