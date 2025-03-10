import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';
import 'completed_section.dart';
import 'in_progress_section.dart';
import 'tab_indicator.dart';
import 'todo_section.dart';

class TasksSection extends StatefulWidget {
  const TasksSection({super.key});

  @override
  State<TasksSection> createState() => _TasksSectionState();
}

class _TasksSectionState extends State<TasksSection> with SingleTickerProviderStateMixin {

  TabController? _tabController;

  final List<Widget> tabs = [
    Tab(text: "To Do"),
    Tab(text: "In Progress"),
    Tab(text: "Completed")
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimension.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tasks",
              style: TextStyle(
                color: CustomColors.gray,
                fontSize: 18.0,
                fontWeight: FontWeight.w500
              ),
            ),
            4.height(),
            TabBar(
              controller: _tabController,
              tabs: tabs,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorAnimation: TabIndicatorAnimation.elastic,
              indicator: TabIndicator(),
              indicatorWeight: 4.0,
              isScrollable: true,
              physics: NeverScrollableScrollPhysics(),
              tabAlignment: TabAlignment.start,
              onTap: (value) {},
              dividerColor: CustomColors.lightGray3,
              labelStyle: TextStyle(
                color: CustomColors.primaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w600
              ),
              unselectedLabelStyle: TextStyle(
                color: CustomColors.gray2,
                fontSize: 16.0,
                fontWeight: FontWeight.w400
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  TodoSection(),
                  InProgressSection(),
                  CompletedSection()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}