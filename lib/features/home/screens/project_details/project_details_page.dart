import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskly/core/extensions/context_extension.dart';

import '../../../../core/styles/custom_colors.dart';
import '_components/description_section.dart';
import '_components/header.dart';
import '_components/tasks_section.dart';
import '_components/teams_section.dart';

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.pop(false),
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
        surfaceTintColor: Colors.transparent
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(),
          DescriptionSection(),
          TeamsSection(),
          TasksSection()
        ],
      ),
    );
  }
}
