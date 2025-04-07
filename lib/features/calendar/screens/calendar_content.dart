import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/date_extension.dart';

import '../../../core/common_widgets/common_scaffold.dart';
import '_components/calendar_appbar.dart';
import '_components/custom_calendar.dart';
import '_components/tasks_section.dart';

class CalendarContent extends StatefulWidget {
  const CalendarContent({super.key});

  @override
  State<CalendarContent> createState() => _CalendarContentState();
}

class _CalendarContentState extends State<CalendarContent> {

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: CustomScrollView(
        slivers: [
          CalendarAppBar(),
          SliverToBoxAdapter(
            child: CustomCalendar(
              onSelectedDate: (date) {
                log("Selected date: ${date.format(pattern: "MMMM dd, yyyy")}");
              },
            )
          ),
          SliverToBoxAdapter(
            child: TasksSection(),
          )
        ]
      ),
    );
  }
}