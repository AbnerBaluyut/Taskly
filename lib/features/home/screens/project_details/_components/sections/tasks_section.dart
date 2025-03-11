import 'package:flutter/material.dart';

import 'competed_section.dart';
import 'in_progress_section.dart';
import 'todo_section.dart';

class TasksSection extends StatelessWidget {

  const TasksSection({super.key, required this.tabController});

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TabBarView(
            controller: tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              TodoSection(),
              InProgressSection(),
              CompetedSection()
            ],
          ),
        )
      ],
    );
  }
}