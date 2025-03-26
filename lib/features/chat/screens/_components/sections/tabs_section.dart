import 'package:flutter/material.dart';

import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';

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
      height: 50.0,
      margin: const EdgeInsets.symmetric(
        horizontal: Dimension.paddingMedium
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.grey.shade200,
      ),
      child: TabBar(
        controller: controller,
        onTap: onTap,
        tabs: [
          Tab(
            child: Text('All Chats')
          ),
          Tab(
            child: Text('Groups')
          ),
        ],
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: CustomColors.primaryColor,
          borderRadius: BorderRadius.circular(100.0),
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
          color: CustomColors.gray2,
          fontWeight: FontWeight.w400,
        ),
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
      ),
    );
  }
}