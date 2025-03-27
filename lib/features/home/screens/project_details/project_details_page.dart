import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../core/common_widgets/common_back_button.dart';
import '../../../../core/styles/custom_colors.dart';
import '../../../../core/styles/dimension.dart';
import '_components/tab_contents/completed_content.dart';
import '_components/sections/description_section.dart';
import '_components/sections/header_section.dart';
import '_components/tab_contents/in_progress_content.dart';
import '_components/tab_contents/todo_content.dart';
import '_components/tab_bar_header_delegate.dart';
import '_components/sections/teams_section.dart';

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({super.key});

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> with SingleTickerProviderStateMixin {

  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.isDarkMode() ? CustomColors.gray2 : Colors.white,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            leading: CommonBackButton(
              onBackPressed: () => context.pop(false),
            ),
            centerTitle: true,
            title: Text(
              "Project Details",
              style: TextStyle(
                color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
                fontSize: 16.0,
                fontWeight: FontWeight.w500
              ),
            ),
            pinned: true,
            surfaceTintColor: Colors.transparent
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderSection(),
                Dimension.spacingMedium.height(),
                DescriptionSection(),
                Dimension.spacingMedium.height(),
                TeamsSection(theme: CustomColors.primaryColor)
              ],
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: TabBarHeaderDelegate(tabController: tabController)
          )
        ],
        body: TabBarView(
          controller: tabController,
          children: [
            TodoContent(),
            InProgressContent(),
            CompletedContent()
          ],
        ),
      ),
    );
  }
}
