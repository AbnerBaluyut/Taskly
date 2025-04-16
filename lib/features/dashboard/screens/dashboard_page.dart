import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:taskly/core/extensions/int_ext.dart';
import '../../../_di/injections.dart';
import '../../../core/common_widgets/common_scaffold.dart';
import '../../../core/router/app_routes.dart';
import '../../calendar/screens/bloc/calendar_bloc.dart';
import '../../calendar/screens/calendar_content.dart';
import '../../chat/screens/bloc/chat_bloc.dart';
import '../../chat/screens/chat_content.dart';
import '../../home/screens/home/bloc/home_bloc.dart';
import '../../home/screens/home/home_content.dart';
import '../../profile/presentation/profile/bloc/profile_bloc.dart';
import '../../profile/presentation/profile/profile_content.dart';
import 'bloc/dashboard_bloc.dart';
import '_components/dashboard_bottom_nav_bar.dart';
import '_components/dashboard_drawer.dart';
import '_components/dashboard_fab.dart';

class DashboardPageWrapper extends StatelessWidget {

  const DashboardPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (_) => DashboardBloc(),
      child: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {

  const DashboardPage({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState  extends State<DashboardPage> with SingleTickerProviderStateMixin {

  TabController? _tabController;

  final _scaffoldKey = GlobalKey<CommonScaffoldState>();

  final _homeBloc = HomeBloc();
  final _calendarBloc = CalendarBloc();
  final _chatBloc = ChatBloc();
  final _profileBloc = ProfileBloc(getIt());

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);
    super.initState();
  }

  void _toggleSideMenu(bool value) {
    if (value) {
      _scaffoldKey.currentState?.openDrawer();
    } else {
      _scaffoldKey.currentState?.closeDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is SideMenuState) {
          _toggleSideMenu(state.isOpenSideMenu);
        }
      },
      child: CommonScaffold(
        key: _scaffoldKey,
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            BlocProvider.value(
              value: _homeBloc,
              child: HomeContent(),
            ),
            BlocProvider.value(
              value: _calendarBloc,
              child: CalendarContent(),
            ),
            BlocProvider.value(
              value: _chatBloc,
              child: ChatContent(),
            ),
            BlocProvider.value(
              value: _profileBloc,
              child: ProfileContent(),
            )
          ]  
        ),
        drawer: DashboardDrawer(),
        drawerEnableOpenDragGesture: _tabController?.index == 0,
        bottomNavigationBar: DashboardBottomNavBar(
          tabController: _tabController,
          onTap: (_) => setState(() {}),
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: AnimatedSlide(
          duration: 500.milliseconds(),
          curve: Curves.easeInOut,
          offset: (_tabController?.index == 0) ? Offset.zero : Offset(0, 2),
          child: AnimatedOpacity(
            duration: 500.milliseconds(),
            opacity: (_tabController?.index == 0) ? 1 : 0,
            child: DashboardFab(
              key: UniqueKey(),
              onTapAddProject: () {
                context.push(AppRoutes.createProject);
              },
              onTapAddTask: () {
                context.push(AppRoutes.createTask);
              },
            ),
          ),
        ),
      ),
    );
  }
}