import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';

import '../../../../../../core/styles/custom_colors.dart';
import '../../../../../../core/styles/dimension.dart';

class TabsSection extends StatelessWidget {
  final TabController? controller;
  final void Function(int)? onTap;

  const TabsSection({
    super.key,
    this.controller,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      margin: const EdgeInsets.symmetric(
        horizontal: Dimension.paddingMedium
      ),
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey.shade400,
          width: 0.5
        )
      ),
      child: TabBar(
        controller: controller,
        onTap: onTap,
        tabs: [
          Tab(
            child: Text('Unread')
          ),
          Tab(
            child: Text('Read')
          ),
        ],
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: CustomColors.primaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        dividerColor: Colors.transparent,
        dividerHeight: 0.0,
        labelStyle: TextStyle(
          fontSize: 15.0,
          color: Colors.white,
          fontWeight: FontWeight.w600
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 15.0,
          color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
          fontWeight: FontWeight.w400,
        ),
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
      ),
    );
  }
}