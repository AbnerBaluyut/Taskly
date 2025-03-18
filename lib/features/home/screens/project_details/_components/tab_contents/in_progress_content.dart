import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../../../core/styles/custom_colors.dart';
import '../../../../../../core/styles/dimension.dart';
import '../cells/task_item.dart';

class InProgressContent extends StatelessWidget {
  const InProgressContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: Dimension.paddingMedium,
        vertical: Dimension.paddingMedium
      ),
      itemCount: 25,
      itemBuilder: (context, index) {
        return TaskItem(theme: CustomColors.primaryColor);
      },
      separatorBuilder: (context, index) => Dimension.paddingMedium.height(),
    );
  }
}