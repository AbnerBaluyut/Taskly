import 'package:flutter/material.dart';

import '../../../../../core/styles/dimension.dart';
import '../../home/_components/cells/item_task.dart';

class TodoSection extends StatelessWidget {
  const TodoSection({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimension.paddingSmall),
          child: ItemTask(
            status: "",
            statusColor: Colors.green,
            label: "Low",
            labelColor: Colors.green.shade900
          ),
        );
      },
    );
  }
}