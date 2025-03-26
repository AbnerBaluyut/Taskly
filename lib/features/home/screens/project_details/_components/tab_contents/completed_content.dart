import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../../../core/styles/dimension.dart';
import '../../../../../../core/common_widgets/common_item_task.dart';

class CompletedContent extends StatelessWidget {
  const CompletedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: Dimension.paddingMedium,
        vertical: Dimension.paddingMedium
      ),
      itemCount: 5,
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