import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_ext.dart';

import '../../../../../../core/styles/custom_colors.dart';

class PrioritySection extends StatelessWidget {

  const PrioritySection({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Priority: ",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: context.isDarkMode() ? Colors.white : CustomColors.gray2
          ),
        ),
        Text(
          "Low",
          style: TextStyle(
            fontSize: 16,
            color: Colors.green.shade700,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}