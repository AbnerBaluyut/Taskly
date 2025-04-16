import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly/core/enums/status_enum.dart';
import 'package:taskly/core/extensions/context_ext.dart';
import 'package:taskly/core/extensions/double_ext.dart';

import '../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../core/common_widgets/common_scaffold.dart';
import '../../../../core/styles/dimension.dart';
import '_components/sections/asignees_section.dart';
import '_components/sections/date_and_time_section.dart';
import '_components/sections/description_section.dart';
import '_components/sections/priority_section.dart';
import '_components/sections/status_section.dart';
import '_components/sections/subtasks_section.dart';
import '_components/task_details_appbar.dart';
import 'bloc/task_details_bloc.dart';

class TaskDetailsPageWrapper extends StatelessWidget {
  const TaskDetailsPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (ctx) => TaskDetailsBloc(),
      child: TaskDetailsPage(),
    );
  }
}

class TaskDetailsPage extends StatefulWidget {

  const TaskDetailsPage({super.key});
  
  @override
  State<StatefulWidget> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {

  final List<bool> _subtasks = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: CustomScrollView(
        slivers: [
          TaskDetailsAppBar(
            onBackPressed: () => context.popSafely(),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimension.paddingMedium,
              vertical: Dimension.paddingLarge
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Dimension.spacingMedium,
                children: [
                  AsigneesSection(),
                  PrioritySection(),
                  DateAndTimeSection(),
                  DescriptionSection(),
                  StatusSection(
                    onChanged: (status) => log("SELECTED STATUS: ${status.getTitle()}"),
                  ),
                  SubtasksSection(
                    substasks: _subtasks,
                    onChanged: (index, value) {
                      setState(() {
                        _subtasks[index] = value;
                      });
                    },
                  ),
                  Dimension.spacingLarge.height(),
                  SizedBox(
                    width: context.screenWidth(),
                    child: CommonElevatedButton(
                      text: "Update",
                      borderRadius: BorderRadius.circular(100.0),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: Dimension.paddingMedium
                      ),
                      onButtonPressed: () => context.popSafely(),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
} 