import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../../../core/styles/dimension.dart';
import '../cells/item_notification.dart';

// WRAP THE BLOC BUILDER HERE 
class UnreadContent extends StatelessWidget {

  const UnreadContent({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(Dimension.paddingMedium),
      itemCount: 2,
      itemBuilder: (context, index) {
        return ItemNotification();
      },
      separatorBuilder: (context, index) {
        return Dimension.spacingMedium.height();
      },
    );
  }
}