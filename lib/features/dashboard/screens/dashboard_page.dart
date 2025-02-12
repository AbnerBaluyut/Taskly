import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import '../../../core/common_widgets/common_scaffold.dart';
import '../../calendar/screens/calendar_content.dart';
import '../../chat/screens/chat_content.dart';
import '../../home/screens/home/home_content.dart';
import '../../profile/screens/profile_content.dart';
import '_components/dashboard_bottom_nav_bar.dart';
import '_components/dashboard_fab.dart';

class DashboardPage  extends StatefulWidget {

  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState  extends State<DashboardPage> with SingleTickerProviderStateMixin {

  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomeContent(),
          CalendarContent(),
          ChatContent(),
          ProfileContent()
        ]  
      ),
      bottomNavigationBar: DashboardBottomNavBar(
        tabController: _tabController,
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: DashboardFab(
        onTapAddProject: () {

        },
        onTapAddTask: () {
          
        },
      ),
    );
  }
}