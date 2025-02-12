import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../core/common_widgets/common_scaffold.dart';
import '../../../../core/common_widgets/common_text_field.dart';
import '../../../../core/styles/dimension.dart';
import '_components/cells/item_project.dart';
import '_components/more_projects_app_bar.dart';

class MoreProjectsPage extends StatefulWidget {
  const MoreProjectsPage({super.key});

  @override
  State<StatefulWidget> createState() => _MoreProjectsPageState();
}

class _MoreProjectsPageState extends State<MoreProjectsPage> {


  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: MoreProjectsAppBar(
        onBackPressed: () => context.pop(),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimension.paddingMedium
            ),
            child: CommonTextField(
              hintText: "Search Project",
              hintStyle: TextStyle(
                fontSize: 15.0,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.0),
                borderSide: BorderSide(color: Colors.grey.shade400)
              ),
              fillColor: Colors.transparent,
              filled: true,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimension.paddingMedium,
                vertical: Dimension.paddingLarge,
              ),
              itemBuilder: (ctx, index) {
                return ItemProject();
              }, 
              separatorBuilder: (ctx, index) {
                return Dimension.spacingMedium.height();
              }, 
              itemCount: 2
            ),
          ),
        ],
      )
    );
  }
}