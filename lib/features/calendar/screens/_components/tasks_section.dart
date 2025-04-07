import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../core/common_widgets/common_item_task.dart';
import '../../../../core/styles/custom_colors.dart';
import '../../../../core/styles/dimension.dart';

class TasksSection extends StatelessWidget {

  const TasksSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimension.paddingMedium
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Dimension.spacingMedium.height(),
          Text(
            'On this day',
            style: TextStyle(
              color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
              fontSize: 20, 
              fontWeight: FontWeight.w500
            ),
          ),
          Dimension.spacingMedium.height(),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
             return CommonItemTask(
              label: "Low",
              statusVisibility: true,
              status: "In Progress",      
             );
            },
            separatorBuilder: (context, index) => Dimension.spacingMedium.height(),
          ),
          Dimension.spacingMedium.height(),
        ],
      ),
    );
  }
}