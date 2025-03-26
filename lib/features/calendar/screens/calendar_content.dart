import 'package:flutter/material.dart';

import '../../../core/common_widgets/common_scaffold.dart';
import '_components/calendar_appbar.dart';

class CalendarContent extends StatelessWidget {
  const CalendarContent({super.key});


  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: CustomScrollView(
        slivers: [
          CalendarAppBar(),
        ]
      ),
    );
  }
}