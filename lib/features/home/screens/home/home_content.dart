import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../core/common_widgets/common_scaffold.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/styles/custom_colors.dart';
import '../../../../core/styles/dimension.dart';
import '../../../dashboard/bloc/bottom_nav_bloc.dart';
import '../../../dashboard/bloc/dashboard_bloc.dart';
import '../../../dashboard/bloc/dashboard_event.dart';
import '_components/home_app_bar.dart';
import '_components/sections/project_section.dart';
import '_components/sections/today_task_section.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<StatefulWidget> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  final _scrollController = ScrollController();
  final _scrollThreshold = 100.0;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {

    final currentScroll = _scrollController.offset;
    final isVisible = context.read<BottomNavCubit>().state;

    if (currentScroll >= _scrollThreshold && isVisible) {
      context.read<BottomNavCubit>().setIsVisibleBottomNav(false);
    } else if (currentScroll < _scrollThreshold && !isVisible) {
      context.read<BottomNavCubit>().setIsVisibleBottomNav(true);
    }
  }

  @override
  Widget build(BuildContext context) {

    return CommonScaffold(
      appBar: HomeAppBar(
        onTapSideMenu: () => context.read<DashboardBloc>().add(OpenSideMenuEvent()),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Dimension.spacingLarge.height(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimension.paddingMedium
              ),
              child: Text(
                "Manage your \ndaily task",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
                  height: 0.9,
                ),
              ),
            ),
            Dimension.spacingSmall.height(),
            ProjectSection(
              onTapViewMore: () => context.push(AppRoutes.moreProjects),
            ),
            Dimension.spacingMedium.height(),
            TodayTaskSection(),
            Dimension.spacingMegaLarge.height(),
          ],
        ),
      )
    );
  } 
}