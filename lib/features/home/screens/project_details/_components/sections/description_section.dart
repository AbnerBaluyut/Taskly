import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_ext.dart';

import '../../../../../../core/styles/custom_colors.dart';
import '../../../../../../core/styles/dimension.dart';
import '../../../../../../core/common_widgets/common_expandable_text.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimension.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(
              color: context.isDarkMode() ? Colors.white : CustomColors.gray,
              fontSize: 18.0,
              fontWeight: FontWeight.w500
            ),
          ),
          CommonExpandableText(text: "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 15"),
        ],
      ),
    );
  }
}