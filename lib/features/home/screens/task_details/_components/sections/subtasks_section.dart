import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../../../core/styles/custom_colors.dart';
import '../../../../../../core/styles/dimension.dart';
import '../cells/item_subtask.dart';

class SubtasksSection extends StatelessWidget {

  const SubtasksSection({super.key, required this.substasks, required this.onChanged});

  final List<bool> substasks;
  final void Function(int, bool) onChanged;

 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Dimension.spacingSmall,
      children: [
        Text(
          "Subtasks:",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: context.isDarkMode() ? Colors.white : CustomColors.gray2
          ),
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (ctx, index) {
            return ItemSubTask(
              title: "Add item $index",
              isSelected: substasks[index],
              onChanged: (value) => onChanged(index, value),
            );
          }, 
          separatorBuilder: (ctx, index) {
            return Dimension.spacingMedium.height();
          }, 
          itemCount: substasks.length
        )
      ],
    );
  }
}