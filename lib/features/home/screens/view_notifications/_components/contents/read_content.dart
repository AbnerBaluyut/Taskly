import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../../../core/styles/dimension.dart';
import '../cells/item_notification_1.dart';
import '../cells/item_notification_2.dart';
import '../cells/item_notification_3.dart';


// WRAP THE BLOC BUILDER HERE 
class ReadContent extends StatelessWidget {

  const ReadContent({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(Dimension.paddingMedium),
      itemCount: 3,
      itemBuilder: (context, index) {
        if (index == 0) {
          return ItemNotification1();
        } else if (index == 1) {
          return ItemNotification2();
        } else {
          return ItemNotification3();
        }
      },
      separatorBuilder: (context, index) {
        return Dimension.spacingMedium.height();
      },
    );
  }
}