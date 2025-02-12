import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../core/common_widgets/common_scaffold.dart';
import '../../../core/styles/custom_colors.dart';
import '../../../core/styles/dimension.dart';
import '_components/home_app_bar.dart';
import '_components/sections/project_section.dart';
import '_components/sections/today_task_section.dart';

class HomeContent extends StatelessWidget {

  const HomeContent({super.key});
  
  @override
  Widget build(BuildContext context) {

    return CommonScaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimension.paddingMedium
              ),
              child: Text(
                "Manage your \ndaily task",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  color: CustomColors.gray2,
                  height: 0.9,
                ),
              ),
            ),
            Dimension.spacingSmall.height(),
            ProjectSection(),
            Dimension.spacingMedium.height(),
            TodayTaskSection()
          ],
        ),
      )
    );
  } 
}