import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_ext.dart';
import 'package:taskly/core/extensions/int_ext.dart';

import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';
import 'tab_indicator.dart';

class TabBarHeaderDelegate extends SliverPersistentHeaderDelegate {

  TabBarHeaderDelegate({required this.tabController});

  final TabController? tabController;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent)  {

    return Container(
      color: context.isDarkMode() ? CustomColors.gray2 : Colors.white,
      padding: EdgeInsets.symmetric(horizontal: Dimension.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tasks",
            style: TextStyle(
              color: context.isDarkMode() ? Colors.white : CustomColors.gray ,
              fontSize: 18.0,
              fontWeight: FontWeight.w500
            ),
          ),
          4.height(),
          TabBar(
            controller: tabController,
            tabs: [
              Tab(text: "To Do"),
              Tab(text: "In Progress"),
              Tab(text: "Completed")
            ],
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorAnimation: TabIndicatorAnimation.elastic,
            indicator: TabIndicator(),
            indicatorWeight: 4.0,
            isScrollable: true,
            physics: NeverScrollableScrollPhysics(),
            tabAlignment: TabAlignment.start,
            labelPadding: EdgeInsets.symmetric(
              horizontal: Dimension.paddingMedium
            ),
            onTap: (value) {},
            dividerColor: CustomColors.lightGray3,
            labelStyle: TextStyle(
              color: CustomColors.primaryColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w600
            ),
            unselectedLabelStyle: TextStyle(
              color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
              fontSize: 16.0,
              fontWeight: FontWeight.w400
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
  }