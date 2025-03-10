import 'package:flutter/material.dart';

import '../../../../../core/styles/dimension.dart';
import '../../home/_components/cells/item_task.dart';

class InProgressSection extends StatelessWidget {
  const InProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimension.paddingSmall),
          child: ItemTask(
            status: "",
            statusColor: Colors.blue,
            label: "Medium",
            labelColor: Colors.blue.shade900
          ),
        );
      },
    );
  }
}