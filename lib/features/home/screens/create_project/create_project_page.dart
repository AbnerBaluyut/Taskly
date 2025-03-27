import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';
import '../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../core/common_widgets/common_scaffold.dart';
import '../../../../core/common_widgets/common_text_field.dart';
import '../../../../core/styles/dimension.dart';
import '_components/add_teams_section.dart';
import '_components/color_theme_section.dart';
import '_components/create_project_appbar.dart';

class CreateProjectPage extends StatefulWidget {

  const CreateProjectPage({super.key});

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {

    
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: CreateProjectAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimension.paddingMedium
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Dimension.spacingMedium.height(),
                      CommonTextField(
                        hintText: "Enter project name",
                        helperText: "Project Name",
                        textInputAction: TextInputAction.next,
                      ),
                      Dimension.spacingMedium.height(),
                      CommonTextField(
                        hintText: "Enter description",
                        helperText: "Description",
                        maxLength: 500,
                        maxLines: 8,
                        minLines: null,
                        showScrollbar: true,
                      ),
                      AddTeamsSection(),
                      Dimension.spacingMedium.height(),
                      ColorThemeSection(
                        onTapCallback: (theme) {
                          log("SELECTED THEME: ${theme.name}");
                        },
                      ),
                      Spacer(),
                      Container(
                        margin: const EdgeInsets.only(
                          top: Dimension.marginMedium
                        ),
                        height: 50.0,
                        width: context.screenWidth(),
                        child: CommonElevatedButton(
                          text: "Create Project",
                          fontColor: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          onButtonPressed: () => context.showAnimatedSuccessDialog(
                            title: 'Project Added Successfully',
                            onButtonPressed: () {
                              context.popSafely(closeOverlay: true);
                            }
                          ),
                        ),
                      ),
                      Dimension.spacingMedium.height(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}