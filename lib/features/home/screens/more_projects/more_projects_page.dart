import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';
import '../../../../core/styles/dimension.dart';
import '_components/cells/item_project.dart';
import '_components/more_projects_app_bar.dart';
import '_components/search_header_delegate.dart';

class MoreProjectsPage extends StatefulWidget {
  const MoreProjectsPage({super.key});

  @override
  State<StatefulWidget> createState() => _MoreProjectsPageState();
}

class _MoreProjectsPageState extends State<MoreProjectsPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MoreProjectsAppBar(
            onBackPressed: () => context.popSafely(),
          ),
          SliverPersistentHeader(
            delegate: SearchHeaderDelegate(),
            pinned: true,
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: Dimension.spacingExtraLarge,
            ),
            sliver: SliverToBoxAdapter(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimension.paddingMedium,
                ),
                itemBuilder: (ctx, index) {

                  if (index == 0) {
                    return ItemProject(
                      tagColor: Colors.blue,
                    );
                  } else if (index == 1) {
                    return ItemProject(
                      tagColor: Colors.green,
                    );
                  } else if (index == 2) {
                    return ItemProject(
                      tagColor: Colors.red,
                    );
                  } else if (index == 3) {
                    return ItemProject(
                      tagColor: Colors.yellow,
                    );
                  } else if (index == 4) {
                    return ItemProject(
                      tagColor: Colors.pink,
                    );
                  } else if (index == 5) {
                    return ItemProject(
                      tagColor: Colors.purple,
                    );
                  } else if (index == 6) {
                    return ItemProject(
                      tagColor: Colors.brown,
                    );
                  } else if (index == 7) {
                    return ItemProject(
                      tagColor: Colors.orange,
                    );
                  } else if (index == 8) {
                    return ItemProject(
                      tagColor: Colors.teal,
                    );
                  } else if (index == 9) {
                    return ItemProject(
                      tagColor: Colors.cyan,
                    );
                  } else if (index == 10) {
                    return ItemProject(
                      tagColor: Colors.amber,
                    );
                  } else if (index == 11) {
                    return ItemProject(
                      tagColor: Colors.lightGreen,
                    );
                  } else {
                    return ItemProject(
                      tagColor: Colors.blue,
                    );
                  }
                }, 
                separatorBuilder: (ctx, index) {
                  return Dimension.spacingMedium.height();
                }, 
                itemCount: 10
              ),
            ),
          )
        ],
      ),
    );
  }
}