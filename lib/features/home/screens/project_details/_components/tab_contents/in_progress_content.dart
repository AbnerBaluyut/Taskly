import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/double_ext.dart';

import '../../../../../../core/styles/dimension.dart';
import '../../../../../../core/common_widgets/common_item_task.dart';

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
        return CommonItemTask(
          label: "Low",
          labelColor: Colors.green.shade800,
          statusVisibility: false,
        );
      },
      separatorBuilder: (context, index) => Dimension.paddingMedium.height(),
    );
  }
}