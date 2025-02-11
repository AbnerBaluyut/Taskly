import 'package:flutter/material.dart';
import '../../../core/common_widgets/common_scaffold.dart';
import '_components/dashboard_bottom_nav_bar.dart';

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
          Center(
            child: Text("Home"),
          ),
          Center(
            child: Text("Calendar"),
          ),
          Center(
            child: Text("Chat"),
          ),
          Center(
            child: Text("Profile"),
          ),
        ]  
      ),
      bottomNavigationBar: DashboardBottomNavBar(
        tabController: _tabController
      )
    );
  }
}