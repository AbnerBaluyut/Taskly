import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../core/common_widgets/common_scaffold.dart';
import '../../../../core/styles/dimension.dart';
import '_components/contents/read_content.dart';
import '_components/contents/unread_content.dart';
import '_components/sections/tabs_section.dart';
import '_components/view_notifications_appbar.dart';

class ViewNotificationsPage extends StatefulWidget {
  const ViewNotificationsPage({super.key});

  @override
  State<ViewNotificationsPage> createState() => _ViewNotificationsPageState();
}

class _ViewNotificationsPageState extends State<ViewNotificationsPage> with SingleTickerProviderStateMixin {

  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return CommonScaffold(
      appBar: ViewNotificationsAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Dimension.spacingSmall.height(),
          TabsSection(
            controller: tabController,
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                ReadContent(),
                UnreadContent()
              ]
            ),
          )
        ],
      ),
    );
  }
}