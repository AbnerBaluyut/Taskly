import 'package:flutter/material.dart';
import 'package:taskly/core/common_widgets/common_elevated_button.dart';

import '../../../../../../core/styles/custom_colors.dart';
import '../../../../../../core/styles/dimension.dart';

class SubtaskItem extends StatefulWidget {

  const SubtaskItem({super.key, required this.title, required this.isSelected, required this.onChanged});

  final String title;
  final bool isSelected;
  final void Function(bool) onChanged;

  @override
  State<SubtaskItem> createState() => _SubtaskItemState();
}

class _SubtaskItemState extends State<SubtaskItem> {


  @override
  Widget build(BuildContext context) {

    return CommonElevatedButton(
      onButtonPressed: () => widget.onChanged(!widget.isSelected),
      padding: const EdgeInsets.all(Dimension.paddingMedium),
      borderSide: BorderSide(
        color: CustomColors.gray4
      ),
      backgroundColor: Colors.white,
      custom: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 15.0,
                color: CustomColors.gray2,
                fontWeight: FontWeight.w400,
              ),
            )
          ),
          Icon(
            widget.isSelected ? Icons.check_circle : Icons.circle_outlined, 
            color: widget.isSelected ? CustomColors.primaryColor : CustomColors.gray3, 
            size: 24.0
          )
        ],
      ),
    );
  }
}