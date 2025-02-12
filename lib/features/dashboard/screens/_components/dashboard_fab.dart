import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import '../../../../core/styles/custom_colors.dart';
import '../../../../core/styles/dimension.dart';

class DashboardFab extends StatefulWidget {

  const DashboardFab({super.key, required this.onTapAddTask, required this.onTapAddProject});

  final VoidCallback onTapAddTask;
  final VoidCallback onTapAddProject;


  @override
  State<StatefulWidget> createState() => _DashboardFabState();
}

class _DashboardFabState extends State<DashboardFab> {

  final _key = GlobalKey<ExpandableFabState>();

  void _closeFab() => _key.currentState?.toggle();

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      key: _key,
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Icons.add, size: 34.0),
        fabSize: ExpandableFabSize.regular,
        foregroundColor: Colors.white,
        backgroundColor: CustomColors.primaryColor,
        shape: const CircleBorder(),
      ),
      closeButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Icons.close, size: 34.0),
        fabSize: ExpandableFabSize.regular,
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        shape: const CircleBorder(),
      ),
      overlayStyle: ExpandableFabOverlayStyle(
        color: Colors.black.withValues(alpha: 0.05),
        blur: 5,
      ),
      childrenOffset: Offset(0.0, 0.0),
      childrenAnimation: ExpandableFabAnimation.none,
      type: ExpandableFabType.up,
      openCloseStackAlignment: Alignment.center,
      distance: 80,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: CustomColors.primaryColor,
                borderRadius: BorderRadius.circular(4.0),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: Dimension.paddingSmall,
                vertical: 2.0
              ),
              child: Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500
                ),
              )
            ),
            10.width(),
            FloatingActionButton(
              onPressed: () {
                widget.onTapAddTask();
                _closeFab();
              },
              shape: CircleBorder(),
              backgroundColor: Colors.white,
              child: Icon(FontAwesomeIcons.calendarPlus, color: CustomColors.primaryColor),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: CustomColors.primaryColor,
                borderRadius: BorderRadius.circular(4.0),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: Dimension.paddingSmall,
                vertical: 2.0
              ),
              child: Text(
                'Create Project',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500
                ),
              )
            ),
            10.width(),
            FloatingActionButton(
              onPressed: () {
                widget.onTapAddProject();
                _closeFab();
              },
              shape: CircleBorder(),
              backgroundColor: Colors.white,
              child: Icon(FontAwesomeIcons.fileCirclePlus, color: CustomColors.primaryColor),
            ),
          ],
        ),
      ],
    );
  }
}